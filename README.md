#  Unsplash Simple App

Приложение предоставляет следующий функционал :
- При запуске подгружаются первые 10 фотографий, доступные на главной странице сайта. 
- Во время пролистывании вниз происходит загрузка следующих фото.
- По нажатию на фотографию происходит переход на экран просмотра, на котором фотография представлена в исходном разрешении. Есть возможность - зумировать изображение. Кнопка назад возвращает на предыдущий экран.

Детали реализации :
- Работа с сетью осуществляется при помощи пакета http;
- Пагинация реализована с помощью пакета infinite_scroll_pagination;
- Для управления состоянием используется StatefulWidget;
- Переходы между экранами происходят через Navigator;

## Ссылка на app_release.apk
https://drive.google.com/file/d/1SfQ9Lbk2vXv9Ln8z5Kug4IGZWdm5zZ9a/view?usp=sharing

## Screenshots

![image](https://user-images.githubusercontent.com/15833765/189926445-385ae483-4b04-422d-bc24-a02d0c3887af.jpg)
