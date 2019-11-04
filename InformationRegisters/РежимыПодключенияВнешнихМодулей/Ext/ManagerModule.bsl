﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции

// Возвращает режим подключения внешнего модуля.
//
// Параметры:
//  ПрограммныйМодуль - ЛюбаяСсылка, ссылка, соответствующая программному модулю, для которого запрашиваются
//    режим подключения.
//
// Возвращаемое значение: Строка - имя профиля безопасности, который должен использоваться для подключения
//  внешнего модуля. Если для внешнего модуля не зарегистрирован режим подключения - возвращается Неопределено.
//
Функция РежимПодключенияВнешнегоМодуля(Знач ПрограммныйМодуль) Экспорт
	
	Если РаботаВБезопасномРежиме.УстановленБезопасныйРежим() Тогда
		
		// При установленном выше по стеку безопасном режиме - подключение внешних модулей
		// возможно только в том же безопасном режиме.
		Результат = БезопасныйРежим();
		
	Иначе
		
		УстановитьПривилегированныйРежим(Истина);
		
		СвойстваПрограммногоМодуля = РаботаВБезопасномРежимеСлужебный.СвойстваДляРегистраРазрешений(ПрограммныйМодуль);
		
		Менеджер = СоздатьМенеджерЗаписи();
		Менеджер.ТипПрограммногоМодуля = СвойстваПрограммногоМодуля.Тип;
		Менеджер.ИдентификаторПрограммногоМодуля = СвойстваПрограммногоМодуля.Идентификатор;
		Менеджер.Прочитать();
		Если Менеджер.Выбран() Тогда
			Результат = Менеджер.БезопасныйРежим;
		Иначе
			Результат = Неопределено;
		КонецЕсли;
		
		ИнтеграцияПодсистемБСП.ПриПодключенииВнешнегоМодуля(ПрограммныйМодуль, Результат);
		РаботаВБезопасномРежимеПереопределяемый.ПриПодключенииВнешнегоМодуля(ПрограммныйМодуль, Результат);
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#КонецЕсли
