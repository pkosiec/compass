package model

type ApplicationTemplate struct {
	ID string
	Name string
	Description *string
	ApplicationInput *ApplicationCreateInput
	Placeholders []ApplicationTemplatePlaceholder
	AccessLevel ApplicationTemplateAccessLevel
}

type ApplicationTemplateAccessLevel string

const (
	GlobalApplicationTemplateAccessLevel ApplicationTemplateAccessLevel = "GLOBAL"
)

type ApplicationTemplatePlaceholder struct {
	Name string
	Description *string
}
