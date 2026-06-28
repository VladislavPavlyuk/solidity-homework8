// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Library {

    struct Book {
        string title;   
        string author;   
        uint year;       
        bool available;  
    }

    // Динамічний масив для зберігання книг у storage
    Book[] public books;

    // 3. Функція додавання книги
    // Використовуємо calldata для текстових параметрів, які лише зчитуються (економія газу) 
    function addBook(string calldata _title, string calldata _author, uint _year) public { 
        books.push(Book(_title, _author, _year, true));
    }

    // 3. Функція отримання інформації про книгу 
    // Модифікатор view (тільки читання), повертає структуру через memory 
    function getBook(uint _index) public view returns (Book memory) {
        return books[_index];
    }

    // 3. Функція зміни року видання 
    // Використовуємо storage, оскільки нам потрібно безпосередньо ОНОВИТИ дані в блокчейні 
    function updateYear(uint _index, uint _newYear) public { 
        Book storage bookToModify = books[_index]; // беремо пряме посилання на елемент масиву 
        bookToModify.year = _newYear;
    }

    // 3. Функція зміни статусу доступності 
    // Використовуємо storage для прямого запису змін на диск смартконтракту 
    function updateAvailability(uint _index, bool _status) public { 
        Book storage bookToModify = books[_index];
        bookToModify.available = _status;
    }

    // 3. Функція отримання кількості книг 
    // Модифікатор view, повертає звичайний тип uint 
    function getBooksCount() public view returns (uint) {
        return books.length;
    }

    // 3. Функція отримання всіх книг одночасно
    // Модифікатор view, повертає весь динамічний масив структур за допомогою модифікатора memory 
    function getAllBooks() public view returns (Book[] memory) {
        return books;
    }
}