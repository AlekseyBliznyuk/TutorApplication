# TutorApplication – Учёт оплаченных уроков студентов

## 📋 Описание проекта
Приложение на SAP CAP (Cloud Application Programming Model) для учёта оплаченных и проведённых уроков студентов.  
Разработано с использованием SAP Fiori Elements и SAP HANA в качестве базы данных.

---

## 🏗️ Архитектура
Проект реализован на трёх уровнях:
1. **Data Model Layer (CDS)**  
   - Entities, Aspects  
   - Associations & Compositions  
   - Аннотации для UI и Service

2. **Service Layer (CAP Service)**  
   - Сервисы и обработчики событий (actions & functions)  
   - Аннотации на уровне сервиса  

3. **UI Layer (SAP Fiori Elements)**  
   - Value Helps  
   - Draft поддержка  
   - Автоматическая генерация интерфейса из аннотаций

---

## 🗄️ Используемые технологии
- `@sap/cds`  
- `@sap/cds-dk`  
- `@sap/xssec`, `@sap/xsenv`  
- SAP HANA HDI контейнер  
- SAP Fiori Elements (OData V4)  
- Node.js (в SAP Business Application Studio)

---

## ⚙️ Настройка и запуск

### Локально
```bash
npm install
cds watch
