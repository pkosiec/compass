package apptemplate

import "github.com/kyma-incubator/compass/components/director/internal/model"

type AppConverter interface {

}

type converter struct{
	appConverter AppConverter
}

func NewConverter(appConverter AppConverter) *converter {
	return &converter{appConverter:appConverter}
}

func (c *converter) ToEntity(in *model.ApplicationTemplate) (*Entity, error) {

}

func (c *converter) FromEntity(entity *Entity) *model.ApplicationTemplate {

}
