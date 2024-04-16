package main

import (
	"log"
	"os"
	"os/exec"
)

func main() {
	entities := []string{
		"article",
		"user",
		"auth",
		"gateway",
	}

	for _, entity := range entities {

		path := "dev_forum-" + entity

		if err := os.Chdir(path); err != nil {
			log.Fatalf("Failed to change current directory: %s", err)
		}

		if err := exec.Command("make", "k8s-mount-project").Run(); err != nil {
			log.Fatalf("Failed to mount project '%s': %s", entity, err)
		}

		if err := exec.Command("make", "k8s-run", "overlay=dev").Run(); err != nil {
			log.Fatalf("Failed to deploy '%s': %s", entity, err)
		}

		if err := os.Chdir(".."); err != nil {
			log.Fatalf("Failed to change current directory: %s", err)
		}
	}
}
