from django.conf import settings
from django.db.models import Case, Value, When
from django.http import JsonResponse

from todo.models import ToDo


def todo(request):
    todos = list(
        ToDo.objects.all()
        .annotate(
            status_display=Case(
                When(status=1, then=Value("For work")),
                When(status=2, then=Value("Done")),
                default=Value("Unidentified"),
            )
        )
        .values()
    )

    return JsonResponse({"secret_key": settings.SECRET_KEY, "todos": todos})
