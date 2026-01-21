from rest_framework.decorators import api_view
from user_app.api.serializers import RegistrationSerializer
from rest_framework.response import Response 
from rest_framework.authtoken.models import Token



@api_view(['POST'])
def registration_view(request):
  if request.method == 'POST':
    serializer = RegistrationSerializer(data=request.data)
    data = {}

    if serializer.is_valid():
      cuenta = serializer.save()
      data['response'] = "Registro exitoso"
      data['username'] = cuenta.username
      data['email'] = cuenta.email
      token, created = Token.objects.get_or_create(user=cuenta)
      data["token"] = token.key

    else:
      data = serializer.errors

    return Response(data)