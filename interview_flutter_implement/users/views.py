"""視圖模組."""
from django.http import HttpResponse
from django.shortcuts import render


def here(request):  # pylint: disable=W0613
    """視圖函式:here.

    網頁顯示I'am LightRock.
    """
    return HttpResponse("言鼎在這裡!")


def add(request, variable_a, variable_b):  # pylint: disable=W0613
    """視圖函式:add.

    網頁顯示將特定網址輸入做加法運算.
    """
    sumsum = int(variable_a) + int(variable_b)
    return HttpResponse(str(sumsum))


def math(request, variable_a, variable_b):
    """視圖函式:math.

    網頁顯示將特定網址輸入做不同數學運算.
    """
    int_a = int(variable_a)
    int_b = int(variable_b)
    sumsum = int_a + int_b
    dif = int_a - int_b
    pro = int_a * int_b
    quo = int_a / int_b
    context = {
        'sum': sumsum,
        'dif': dif,
        'pro': pro,
        'quo': quo
    }

    return render(request, 'math.html', context)


def menu(request):
    """餐廳的菜單.

    有菜名、價格、說明以及會不會辣。
    """
    food1 = {
        'name': '番茄炒蛋',
        'price': 60,
        'comment': '好吃',
        'is_spicy': False
    }
    food2 = {
        'name': '番茄炒蛋',
        'price': 60,
        'comment': '好吃',
        'is_spicy': False
    }
    foods = [food1, food2]  # pylint: disable=W0641
    return render(request, 'menu.html', locals())


def index(request):  # pylint: disable=W0613
    """首頁."""
    return render(request, 'index.html')
