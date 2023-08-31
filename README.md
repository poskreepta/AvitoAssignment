
# # Avito AvitoAssignment for iOS intern
## Описание проекта

Данный проект является реализацией тестового задания для стажёра iOS и представляет собой приложение для iOS (marketplace), состоящее из двух экранов:

1.  **Список товаров**: Этот экран является стартовым и отображает список товаров в формате двух столбцов. 
<div style="display: flex; flex-direction: row;">  <img src="https://srv2.imgonline.com.ua/result_img/imgonline-com-ua-Resize-o8FkyyLJecugQpQ.png" alt="https://srv2.imgonline.com.ua/result_img/imgonline-com-ua-Resize-o8FkyyLJecugQpQ.png" style="margin-right: 10px;"> <img src="https://srv4.imgonline.com.ua/result_img/imgonline-com-ua-Resize-KrTLcTqSk8MW.png" alt="https://srv4.imgonline.com.ua/result_img/imgonline-com-ua-Resize-KrTLcTqSk8MW.png" style="margin-right: 10px;">  </div>   
2.  **Детальная карточка товара**: Этот экран открывается при нажатии на элемент списка товаров. Он отображает подробную информацию о выбранном товаре.

## Архитектура

Проект разработан с использованием архитектурного паттерна MVVM + Сoordinator (Model-View-ViewModel) с дополнительным слоем координатора для управления навигацией между экранами.

##  API
URL для запроса на главном экране.
[https://www.avito.st/s/interns-ios/main-page.json/](https://www.avito.st/s/interns-ios/main-page.json)
URL для запроса на детальной странице. ID берется из данных для главного экрана.
[https://www.avito.st/s/interns-ios/details/{itemId}.json/](https://www.avito.st/s/interns-ios/details/{itemId}.json)

## Technologies and Libraries
- UIKit
- MVVM-C
- SnapKit
-  **Programmatically**  written UI, without the use of Storyboards
- JSON, Work with API, NetworkLayer
## Contribution

If you have any suggestions or find a bug, feel free to create an issue or submit a pull request. We appreciate your contributions!

## Requirements
-   iOS 14.0 or higher
-   Xcode 12 or higher
-   Swift 5.3 or higher
