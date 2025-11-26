from django.db import models

class Plataforma(models.Model):
  nombre = models.CharField(max_length=30)
  acerca = models.CharField(max_length=150)
  sitio_web = models.URLField(max_length=100)

  class Meta:
      db_table = 'plataforma'

  def __str__(self):
    return self.nombre

class Contenido(models.Model):
  plataforma = models.ForeignKey('Plataforma', on_delete=models.CASCADE)
  titulo = models.CharField(max_length=100)
  descripcion = models.CharField(max_length=200)
  activo = models.BooleanField(default=True)
  created_at = models.DateTimeField(auto_now_add=True)
  
  class Meta:
      db_table = 'contenido'

  def __str__(self):
    return self.titulo