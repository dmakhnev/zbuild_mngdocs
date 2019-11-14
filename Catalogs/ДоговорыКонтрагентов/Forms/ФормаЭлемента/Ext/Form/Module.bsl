﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УправлениеВидимостьюЭлементовФормы(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура УстановленСрокОплатыПриИзменении(Элемент)
	
	УправлениеВидимостьюЭлементовФормы(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиентеНаСервереБезКонтекста
Процедура УправлениеВидимостьюЭлементовФормы(Форма)
	
	Элементы = Форма.Элементы;
	Объект	 = Форма.Объект;
	
	Элементы.СрокОплаты.Видимость = Объект.УстановленСрокОплаты;
	
КонецПроцедуры

#КонецОбласти