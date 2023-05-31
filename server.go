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

package main

import (
	_ "embed"
	"os"

	grpcserver "github.com/dvaumoron/puzzlegrpcserver"
	"github.com/dvaumoron/puzzleindentlangserver/templateserver"
	pb "github.com/dvaumoron/puzzletemplateservice"
)

//go:embed version.txt
var version string

func main() {
	s := grpcserver.Make(templateserver.TemplateKey, version)
	templatesPath := os.Getenv("TEMPLATES_PATH")
	pb.RegisterTemplateServer(s, templateserver.New(templatesPath, s.Logger))
	s.Start()
}
