from django.db import models
from django.contrib.auth.models import User

class Plataforma(models.Model):
  nombre = models.CharField(max_length=30)
  acerca = models.CharField(max_length=150)
  sitio_web = models.URLField(max_length=100)

  class Meta:
      db_table = 'plataforma'

  def __str__(self):
    return self.nombre

class Contenido(models.Model):
  plataforma = models.ForeignKey('Plataforma', on_delete=models.CASCADE, related_name='contenidos')
  titulo = models.CharField(max_length=100)
  descripcion = models.CharField(max_length=200)
  activo = models.BooleanField(default=True)
  created_at = models.DateTimeField(auto_now_add=True)
  
  class Meta:
      db_table = 'contenido'

  def __str__(self):
    return self.titulo
  
class Resena(models.Model):
  usuario = models.ForeignKey(User, on_delete=models.CASCADE)
  puntuacion = models.PositiveSmallIntegerField()
  descripcion = models.CharField(max_length=200, null=True, blank=True)
  contenido = models.ForeignKey('Contenido', on_delete=models.CASCADE, related_name="resenas") #contenido se relaciona con reseñas
  activo = models.BooleanField(default=True)
  created_at = models.DateTimeField(auto_now_add=True)
  updated_at = models.DateTimeField(auto_now_add=True)

  class Meta:
      db_table = 'resena'

  def __str__(self):
    return str(self.puntuacion)

