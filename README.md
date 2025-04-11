# 🚔 Crime Analysis and Reporting System (C.A.R.S.) - CASE STUDY - Hexaware


### J502 Abhishek A G
---

## 📚 Case Study Overview
---
- Record crime incidents with validated officer, victim, and suspect details.
- Retrieve and update incidents based on status or ID.
- Generate reports for specific incidents.
- Analyze crime data over a time range or based on location/type.
---

## 💡 Features

- ✅ **Create** new crime incidents with foreign key checks.
- 🔍 **Search** incidents by:
  - Incident ID
  - Type
  - Status
  - Location
- 📅 **Filter incidents by date range**.
- ✏️ **Update** incident status.
- 📄 **Generate reports** for specific incidents.
- 🧪 **JUnit 5 tests** for incident creation, updates, and validations.
- 🔒 **Custom Exceptions** like:
  - `OfficerNotFoundException`
  - `VictimNotFoundException`
  - `SuspectNotFoundException`
  - `IncidentNumberNotFoundException`

---

## 🧱 Project Architecture
```
CrimeAnalysisSystem/CrimeAnalysisSystem/
├── entity/
│   ├── Incident.java
│   ├── Officer.java
│   ├── Victim.java
│   └── ... (Other entity classes)
│
├── dao/
│   ├── CrimeAnalysisService.java
│   └── CrimeAnalysisServiceImpl.java
│
├── exception/
│   ├── OfficerNotFoundException.java
│   ├── IncidentNumberNotFoundException.java
│   └── ... (Other custom exceptions)
│
├── util/
│   ├── DBConnUtil.java
│   └── DBPropertyUtil.java
│
├── main/
│   └── MainModule.java
│
├── test/
│   └── jtesting.java
│
├── README.md
└── db.properties

```

