from rest_framework import serializers

class PeliculaSerializer(serializers.Serializer):
  id = serializers.IntegerField(read_only=True)
  titulo = serializers.CharField()
  descripcion = serializers.CharField()
  activo = serializers.BooleanField()