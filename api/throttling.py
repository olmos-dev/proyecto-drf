from rest_framework.throttling import UserRateThrottle

class CrearResenaThrottle(UserRateThrottle):
  scope = 'crear-resena'

class ListarResenaThrottle(UserRateThrottle):
  scope = 'listar-resena'