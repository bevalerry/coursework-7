-- Создание таблицы "Автосалон"
CREATE TABLE Autosalons (
    id SERIAL PRIMARY KEY,  -- Идентификатор автосалона, автоматически увеличиваемое значение
    name VARCHAR(255) NOT NULL,         -- Название автосалона
    address VARCHAR(255),               -- Адрес автосалона
    phone VARCHAR(20),                  -- Телефон автосалона
    email VARCHAR(100)                  -- Электронная почта автосалона
);

-- Создание таблицы "Сотрудник"
CREATE TABLE Employees (
    id SERIAL PRIMARY KEY,  -- Идентификатор сотрудника
    name VARCHAR(255) NOT NULL,         -- Имя сотрудника
    position VARCHAR(100),              -- Должность сотрудника
    hire_date DATE,                     -- Дата найма сотрудника
    salary DECIMAL(10, 2),              -- Зарплата сотрудника
    autosalon_id INT,                   -- Идентификатор автосалона (внешний ключ)
    FOREIGN KEY (autosalon_id) REFERENCES Autosalons(id)  -- Связь с автосалоном
);

-- Создание таблицы "Клиент"
CREATE TABLE Clients (
    id SERIAL PRIMARY KEY,  -- Идентификатор клиента
    name VARCHAR(255) NOT NULL,         -- Имя клиента
    phone VARCHAR(20),                  -- Телефон клиента
    email VARCHAR(100),                 -- Электронная почта клиента
    address VARCHAR(255)                -- Адрес клиента
);

-- Создание таблицы "Автомобиль"
CREATE TABLE Cars (
    id SERIAL PRIMARY KEY,  -- Идентификатор автомобиля
    brand VARCHAR(100) NOT NULL,        -- Марка автомобиля
    model VARCHAR(100) NOT NULL,        -- Модель автомобиля
    year INT,                           -- Год выпуска
    color VARCHAR(50),                  -- Цвет автомобиля
    price DECIMAL(10, 2),               -- Цена автомобиля
    stock INT,                          -- Количество автомобилей в наличии
    autosalon_id INT,                   -- Идентификатор автосалона (внешний ключ)
    FOREIGN KEY (autosalon_id) REFERENCES Autosalons(id)  -- Связь с автосалоном
);

-- Создание таблицы "Поставщик"
CREATE TABLE Suppliers (
    id SERIAL PRIMARY KEY,  -- Идентификатор поставщика
    name VARCHAR(255) NOT NULL,         -- Название поставщика
    phone VARCHAR(20),                  -- Телефон поставщика
    email VARCHAR(100),                 -- Электронная почта поставщика
    address VARCHAR(255)                -- Адрес поставщика
);

-- Создание таблицы "Заказ"
CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,  -- Идентификатор заказа
    order_date DATE NOT NULL,            -- Дата оформления заказа
    status VARCHAR(50),                  -- Статус заказа (например, "в обработке", "выполнен")
    client_id INT,                       -- Идентификатор клиента (внешний ключ)
    employee_id INT,                     -- Идентификатор сотрудника (внешний ключ)
    car_id INT,                          -- Идентификатор автомобиля (внешний ключ)
    supplier_id INT,                     -- Идентификатор поставщика (внешний ключ)
    amount DECIMAL(10, 2),               -- Сумма заказа
    FOREIGN KEY (client_id) REFERENCES Clients(id),  -- Связь с клиентом
    FOREIGN KEY (employee_id) REFERENCES Employees(id),  -- Связь с сотрудником
    FOREIGN KEY (car_id) REFERENCES Cars(id),   -- Связь с автомобилем
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)  -- Связь с поставщиком
);
