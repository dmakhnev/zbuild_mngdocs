﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Получает описание предопределенных наборов свойств.
//
// Параметры:
//  Наборы - ДеревоЗначений - с колонками:
//     * Имя           - Строка - Имя набора свойств. Формируется из полного имени объекта
//                       метаданных заменой символа "." на "_".
//                       Например, "Документ_ЗаказПокупателя".
//     * Идентификатор - УникальныйИдентификатор - Идентификатор ссылки предопределенного элемента.
//     * Используется  - Неопределено, Булево - Признак того, что набор свойств используется.
//                       Например, можно использовать для скрытия набора по функциональным опциям.
//                       Значение по умолчанию - Неопределено, соответствует значению Истина.
//     * ЭтоГруппа     - Булево - Истина, если набор свойств является группой.
//
Процедура ПриПолученииПредопределенныхНаборовСвойств(Наборы) Экспорт
	
	// Справочник "Контрагенты"
	Набор = Наборы.Строки.Добавить();
	Набор.Имя 			= "Справочник_Контрагенты";
	Набор.Идентификатор = Новый УникальныйИдентификатор("ef206f68-29df-45e5-b44a-6021134c4cf0");
	Набор.Используется	= Истина;
	Набор.ЭтоГруппа 	= Ложь;
	
КонецПроцедуры

// Получает наименования наборов свойств второго уровня на разных языках.
//
// Параметры:
//  Наименования - Соответствие - представление набора на переданном языке:
//     * Ключ     - Строка - Имя набора свойств. Например, "Справочник_Партнеры_Общие".
//     * Значение - Строка - Наименование набора для переданного кода языка.
//  КодЯзыка - Строка - Код языка. Например, "en".
//
// Пример:
//  Наименования["Справочник_Партнеры_Общие"] = НСтр("ru='Общие'; en='General';", КодЯзыка);
//
Процедура ПриПолученииНаименованийНаборовСвойств(Наименования, КодЯзыка) Экспорт
	
	
	
КонецПроцедуры

// Заполняет наборы свойств объекта. Обычно требуется, если наборов более одного.
//
// Параметры:
//  Объект       - ЛюбаяСсылка      - ссылка на объект со свойствами.
//               - ФормаКлиентскогоПриложения - форма объекта, к которому подключены свойства.
//               - ДанныеФормыСтруктура - описание объекта, к которому подключены свойства.
//
//  ТипСсылки    - Тип - тип ссылки владельца свойств.
//
//  НаборыСвойств - ТаблицаЗначений - с колонками:
//                    Набор - СправочникСсылка.НаборыДополнительныхРеквизитовИСведений.
//                    ОбщийНабор - Булево - Истина, если набор свойств содержит свойства,
//                     общие для всех объектов.
//                    // Далее свойства элемента формы типа ГруппаФормы вида обычная группа
//                    // или страница, которая создается, если наборов больше одного без учета
//                    // пустого набора, который описывает свойства группы удаленных реквизитов.
//                    
//                    // Если значение Неопределено, значит, использовать значение по умолчанию.
//                    
//                    // Для любой группы управляемой формы.
//                    Высота                   - Число.
//                    Заголовок                - Строка.
//                    Подсказка                - Строка.
//                    РастягиватьПоВертикали   - Булево.
//                    РастягиватьПоГоризонтали - Булево.
//                    ТолькоПросмотр           - Булево.
//                    ЦветТекстаЗаголовка      - Цвет.
//                    Ширина                   - Число.
//                    ШрифтЗаголовка           - Шрифт.
//                    
//                    // Для обычной группы и страницы.
//                    Группировка              - ГруппировкаПодчиненныхЭлементовФормы.
//                    
//                    // Для обычной группы.
//                    Отображение              - ОтображениеОбычнойГруппы.
//                    
//                    // Для страницы.
//                    Картинка                 - Картинка.
//                    ОтображатьЗаголовок      - Булево.
//
//  СтандартнаяОбработка - Булево - начальное значение Истина. Указывает, получать ли
//                         основной набор, когда НаборыСвойств.Количество() равно нулю.
//
//  КлючНазначения   - Неопределено - (начальное значение) - указывает вычислить
//                      ключ назначения автоматически и добавить к значениям свойств
//                      формы КлючНазначенияИспользования и КлючСохраненияПоложенияОкна,
//                      чтобы изменения формы (настройки, положение и размер) сохранялись
//                      отдельно для разного состава наборов.
//                      Например, для каждого вида номенклатуры - свой состав наборов.
//
//                    - Строка - (не более 32 символа) - использовать указанный ключ
//                      назначения для добавления к значениям свойств формы.
//                      Пустая строка - не изменять свойства ключей формы, т.к. они
//                      устанавливается в форме и уже учитывают различия состава наборов.
//
//                    Добавка имеет формат "КлючНаборовСвойств<КлючНазначения>",
//                    чтобы <КлючНазначения> можно было обновлять без повторной добавки.
//                    При автоматическом вычислении <КлючНазначения> содержит хеш
//                    идентификаторов ссылок упорядоченных наборов свойств.
//
Процедура ЗаполнитьНаборыСвойствОбъекта(Знач Объект, ТипСсылки, НаборыСвойств, СтандартнаяОбработка, КлючНазначения) Экспорт
	
	
	
КонецПроцедуры

#КонецОбласти

