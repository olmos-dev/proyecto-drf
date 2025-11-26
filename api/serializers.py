from rest_framework import serializers
from peliculas.models import Pelicula

class PeliculaSerializer(serializers.Serializer):
  id = serializers.IntegerField(read_only=True)
  titulo = serializers.CharField()
  descripcion = serializers.CharField()
  activo = serializers.BooleanField()

  def create(self, validated_data):
    return Pelicula.objects.create(**validated_data)
  
  def update(self, instance, validated_data):
    instance.titulo = validated_data.get("titulo", instance.titulo)
    instance.descripcion = validated_data.get("descripcion", instance.descripcion)
    instance.activo = validated_data.get("activo", instance.activo)
    instance.save()
    return instance