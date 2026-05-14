import random

from django.core.management.base import BaseCommand
from faker import Faker

from peliculas.models import Contenido, Plataforma


class Command(BaseCommand):
    help = 'Pobla la tabla Contenido con datos de prueba'

    def handle(self, *args, **kwargs):
        fake = Faker('es_MX')

        plataformas = Plataforma.objects.all()

        if not plataformas.exists():
            self.stdout.write(
                self.style.ERROR('No existen plataformas registradas')
            )
            return

        contenidos = []

        for _ in range(100):

            contenido = Contenido(
                plataforma=random.choice(plataformas),
                titulo=fake.sentence(nb_words=4),
                descripcion=fake.text(max_nb_chars=180),
                activo=random.choice([True, False]),
                avg_calif=round(random.uniform(1, 5), 1),
                numero_calif=random.randint(0, 10)
            )

            contenidos.append(contenido)

        Contenido.objects.bulk_create(contenidos)

        self.stdout.write(
            self.style.SUCCESS('Se insertaron 100 registros correctamente')
        )