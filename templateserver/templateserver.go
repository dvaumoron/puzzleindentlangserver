/*
 *
 * Copyright 2023 puzzleindentlangserver authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package templateserver

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"

	"github.com/dvaumoron/indentlang/adapter"
	"github.com/dvaumoron/indentlang/template"
	pb "github.com/dvaumoron/puzzletemplateservice"
	"github.com/uptrace/opentelemetry-go-extra/otelzap"
	"go.uber.org/zap"
)

const TemplateKey = "puzzleTemplate"

var errInternal = errors.New("internal service error")

// server is used to implement puzzletemplateservice.TemplateServer
type server struct {
	pb.UnimplementedTemplateServer
	templates map[string]template.Template
	logger    *otelzap.Logger
}

func New(templatesPath string, logger *otelzap.Logger) pb.TemplateServer {
	templates, err := adapter.LoadTemplates(templatesPath)
	if err != nil {
		logger.Fatal("Failed to load templates", zap.Error(err))
	}
	return server{templates: templates, logger: logger}
}

func (s server) Render(ctx context.Context, request *pb.RenderRequest) (*pb.Rendered, error) {
	logger := s.logger.Ctx(ctx)

	var data map[string]any
	err := json.Unmarshal(request.Data, &data)
	if err != nil {
		logger.Error("Failed during JSON parsing", zap.Error(err))
		return nil, errInternal
	}
	var content bytes.Buffer
	template, ok := s.templates[request.TemplateName]
	if !ok {
		logger.Error("Template not found")
		return nil, errInternal
	}
	if err = template.Execute(&content, data); err != nil {
		logger.Error("Failed during indentlang template call", zap.Error(err))
		return nil, errInternal
	}
	return &pb.Rendered{Content: content.Bytes()}, nil
}
