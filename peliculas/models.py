from django.db import models

class Pelicula(models.Model):
  titulo = models.CharField(max_length=100)
  descripcion = models.CharField(max_length=200)
  activo = models.BooleanField(default=True)

  class Meta:
      db_table = 'pelicula'

  def __str__(self):
    return self.titulo