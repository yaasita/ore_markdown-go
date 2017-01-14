package main

import (
	"encoding/base64"
	"io/ioutil"
	"net/http"
	"os"
	"regexp"
	"strings"
)

func embedded_image(html string, directory string) string {
	lines := strings.Split(html, "\n")
	for i := range lines {
		if img_tag := regexp.MustCompile(`<img src="(.+?)" alt="(.+?)".* />`); img_tag.MatchString(lines[i]) {
			group := img_tag.FindSubmatch([]byte(lines[i]))
			image_file := string(group[1])
			alt_tag := string(group[2])
			image_data, err := ioutil.ReadFile(directory + string(os.PathSeparator) + image_file)
			if err != nil {
				panic(err)
			}
			// mime type
			mimeType := http.DetectContentType(image_data)
			// base64
			encode_data := base64.StdEncoding.EncodeToString(image_data)
			replace_str := `<img src="data:` + mimeType + `;base64,` + encode_data + `" ` + `alt="` + alt_tag + `" />`
			lines[i] = img_tag.ReplaceAllString(lines[i], replace_str)
		}
	}
	result := strings.Join(lines, "\n")
	return result
}
