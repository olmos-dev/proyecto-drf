from rest_framework import serializers
from peliculas.models import Pelicula

class PeliculaSerializer(serializers.ModelSerializer):
  tam_titulo = serializers.SerializerMethodField()

  class Meta:
    model = Pelicula
    fields = ['id','titulo', 'descripcion', 'activo', 'tam_titulo']

  #realizar un calculo o funcion especifica - SerializerMethodField
  def get_tam_titulo(self, objecto):
     return len(objecto.titulo)

  #VALIDACIONES
  def validate(self, data):
    if data['titulo'] == data['descripcion']:
      raise serializers.ValidationError("El titulo y la descripción deben ser diferentes")
    return data
  
  def validate_titulo(self, value):
    if len(value) < 2:
      raise serializers.ValidationError("El titulo es muy corto")
    return value
  
  def validate_descripcion(self, value):
        if len(value) < 2:
            raise serializers.ValidationError("La descripción es muy corta")
        return value
