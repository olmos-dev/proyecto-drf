from rest_framework import serializers
from peliculas.models import Pelicula

def descripcion_corta(value):
  if len(value) < 2:
    raise serializers.ValidationError("La descripcion es muy corta")
  return value
class PeliculaSerializer(serializers.Serializer):
  id = serializers.IntegerField(read_only=True)
  titulo = serializers.CharField()
  descripcion = serializers.CharField(validators=[descripcion_corta])
  activo = serializers.BooleanField()

  def create(self, validated_data):
    return Pelicula.objects.create(**validated_data)
  
  def update(self, instance, validated_data):
    instance.titulo = validated_data.get("titulo", instance.titulo)
    instance.descripcion = validated_data.get("descripcion", instance.descripcion)
    instance.activo = validated_data.get("activo", instance.activo)
    instance.save()
    return instance
  
  #VALIDACIONES
  def validate(self, data):
    if data['titulo'] == data['descripcion']:
      raise serializers.ValidationError("El titulo y la descripción deben ser diferentes")
    return data
  
  def validate_titulo(self, value):
    if len(value) < 2:
      raise serializers.ValidationError("El titulo es muy corto")
    return value
  

