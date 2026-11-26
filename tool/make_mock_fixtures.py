"""Writes assets/mock_api/*.json - sample responses for MockApi (sample data)."""
import json, os, sys

out = os.path.join(sys.argv[1], "assets", "mock_api")
os.makedirs(out, exist_ok=True)

ORG, APP, MEMBER = "1001", "MZIZICMS", "M-20481"
IMG = lambda seed, w=800, h=500: f"https://picsum.photos/seed/mzizi-{seed}/{w}/{h}"
YT = lambda vid: f"https://www.youtube.com/embed/{vid}?enablejsapi=1&autoplay=1&fs=0?loop=0&modestbranding=1&rel=0"

member = {
    "StudentFullName": "Grace Wanjiku Kamau", "TwoNames": "Grace Wanjiku",
    "RegistrationNumber": MEMBER, "Email": "grace.kamau@example.com",
    "StudentPhoneNo": "0712 345 678",
}

F = {
    "UserCredentials": {
        "id": None, "UserID": "20481", "UserType": "Member", "SchoolID": "1",
        "OrganizationID": ORG, "AppCode": APP, "Username": "demo", "Password": "demo",
    },
    "MziziAppVersion": {"ForceUpdate": False},
    "PortalGetGlobalSettings": {
        "GlobalSettingName": "PORTAL_URL",
        "GlobalSettingValue": "https://mock.mzizi.local/",
    },
    "PortalStudentInfo": {
        "id": None, **member, "DOB": "4/12/1990", "DateOfAdmission": "1/15/2018",
        "Balance": "2500.00", "MeanGrade": "", "MeanScore": "", "Attendance": "92",
        "Events": "4", "PhotoUrl": IMG("member", 300, 300), "CopyrightYear": "2026",
        "ClassStream": "Youth Ministry", "SchoolName": "Mzizi Community Church",
        "SchoolMotto": "Rooted in Christ", "BillingBalance": "2500.00",
        "PortalAccount": MEMBER, "PortalPaybill": "247247", "OrganizationID": ORG,
    },
    "PortalStudentProfile": {
        "StudentFullName": member["StudentFullName"], "InstituteName": "Mzizi Community Church",
        "GroupName": "Youth Ministry", "StudentPhoneNo": member["StudentPhoneNo"],
        "Email": member["Email"], "RegistrationNumer": MEMBER,
        "SchoolName": "Mzizi Community Church", "CourseCode": "YTH",
        "LevelName": "Member", "Nationality": "Kenyan", "NationalID": "",
    },
    "FilteredStudentInfo": {
        "id": None, "Balance": "2500.00", "BillingBalance": "2500.00",
        "PortalAccount": MEMBER, "PortalPaybill": "247247", "OrganizationID": ORG,
    },
    "SyncMyAccount": {
        "id": None, "BillingBalance": "2500.00", "OrganizationID": ORG,
        "PaybillNo": "247247", "PortalAccount": MEMBER, "Balance": "2500.00",
    },
    "PortalContacts": [
        {"id": None, "SettingName": n, "SettingValue": v} for n, v in [
            ("PHONE", "0700 000 111"), ("EMAIL", "info@example.org"),
            ("ADDRESS", "P.O. Box 12345-00100, Nairobi"), ("WEBSITE", "https://church.mzizi.co.ke"),
            ("LOCATION", "Ngong Road, Nairobi"),
        ]
    ],
    "PortalEvents": [
        {"id": None, "EventsTitle": t, "Venue": v, "StartDate": f"{{{{date+{d}}}}}",
         "EndDate": f"{{{{date+{d + l}}}}}", "StartTime": s, "EndTime": e, "Description": desc}
        for t, v, d, l, s, e, desc in [
            ("Youth Conference", "Main Sanctuary", 3, 2, "9:00 AM", "4:00 PM",
             "Two days of worship, teaching and fellowship for young adults."),
            ("Christmas Carols Night", "Church Grounds", 26, 0, "6:00 PM", "9:00 PM",
             "An evening of carols, candles and family. Bring a friend."),
            ("Men's Breakfast", "Fellowship Hall", 10, 0, "7:00 AM", "9:30 AM",
             "Monthly breakfast and devotion for the men's fellowship."),
            ("Community Medical Camp", "Kibera Outreach Centre", 17, 0, "8:00 AM", "3:00 PM",
             "Free health screening run with volunteer doctors and nurses."),
        ]
    ],
    "PortalNotifications": [
        {"id": None, "MsgID": i + 1, "Msg": m, "DateSent": f"{{{{date-{d}}}}}"}
        for i, (m, d) in enumerate([
            ("Receipt: Ksh 1,000.00 received for Tithe. Thank you for giving.", 1),
            ("Reminder: Youth Conference event starts this Saturday at 9:00 AM.", 2),
            ("Your booking for the Sunday 2nd Service is confirmed.", 4),
            ("New chat message from the Pastoral Care team.", 6),
            ("Transaction: Ksh 500.00 Building Fund contribution received.", 9),
        ])
    ],
    "PortalNotificationsReadTracking": "OK",
    "PortalSiblings": [
        {"id": None, "StudentID": "20481", "RegistrationNumber": MEMBER,
         "StudentFullName": member["StudentFullName"], "CourseName": "Youth Ministry", "StudentStatus": "Active"},
        {"id": None, "StudentID": "20482", "RegistrationNumber": "M-20482",
         "StudentFullName": "Daniel Kamau Njoroge", "CourseName": "Men's Fellowship", "StudentStatus": "Active"},
    ],
    "PortalParentChat": [
        {"id": None, "Msg": m, "DatePosted": f"{{{{date-{d}}}}}", "Actor": a,
         "sent": True, "notSent": False, "sending": False}
        for m, d, a in [
            ("Hello Pastor, I would like to book a counselling session.", 3, "Parent"),
            ("Hello Grace, sure. Thursday at 4 PM works. See you then.", 3, "School"),
            ("Thank you, I'll be there.", 2, "Parent"),
        ]
    ],
    "PortalToDoList": [
        {"id": None, "DiaryEntryTypeID": "1", "DiaryEntryType": "Bible Study", "DiaryEntriesCount": "2"},
        {"id": None, "DiaryEntryTypeID": "2", "DiaryEntryType": "Announcements", "DiaryEntriesCount": "1"},
    ],
    "PortalDetailedToDoList": [
        {"id": None, "Name": n, "ToDoAge": "2 days ago", "DueDate": "{{date+5}}", "DocPath": "",
         "Body": b, "UnitName": u, "TeacherMemoID": str(i), "IsFeedbackRequired": "0",
         "IsDocPathAvailable": "0", "IsVideoLinkAvailable": "0", "IsDocPathExtraAvailable": "0",
         "IsAudioLinkAvailable": "0", "DocPathExtra": "", "VideoLink": "", "AudioLink": "",
         "TimeOffSet": "0", "PublishDate": "{{date-2}}", "StartTime": "6:00 PM", "EndTime": "7:30 PM",
         "SubmitStatus": "Pending"}
        for i, (n, b, u) in enumerate([
            ("Romans study, week 3", "Read Romans 5-6 before Wednesday's study.", "Bible Study"),
            ("Choir practice moved", "Choir practice moves to Friday this week.", "Announcements"),
        ], 1)
    ],
    "PortalDetailedTransaction": [
        {"id": None, "RefNo": r, "TranAmount": a, "BalAmount": b, "CurrentAmount": a,
         "TranType": t, "TransType": t, "DatePosted": f"{{{{date-{d}}}}}"}
        for r, a, b, t, d in [
            ("QK7H2LM9", "1000.00", "2500.00", "Tithe", 1),
            ("QK2J8PX1", "500.00", "3500.00", "Building Fund", 9),
            ("QJ9D4TR6", "2000.00", "4000.00", "Offering", 16),
        ]
    ],
    "PortalRecentTransactions": [
        {"id": None, "RefNo": r, "TranType": t, "TranDate": f"{{{{date-{d}}}}}",
         "TranAmount": a, "BalAmount": b, "TransType": t}
        for r, t, d, a, b in [
            ("QK7H2LM9", "Tithe", 1, "1000.00", "2500.00"),
            ("QK2J8PX1", "Building Fund", 9, "500.00", "3500.00"),
            ("QJ9D4TR6", "Offering", 16, "2000.00", "4000.00"),
        ]
    ],
    "PortalSMSHistory": [
        {"id": None, "MsgID": 100 + i, "Msg": m, "DateSent": f"{{{{date-{d}}}}}"}
        for i, (m, d) in enumerate([
            ("Receipt: Ksh 1,000.00 received for Tithe. Thank you.", 1),
            ("Join us for the Youth Conference event this Saturday.", 2),
            ("Sunday services: 7:30 AM, 9:30 AM and 11:30 AM.", 5),
        ])
    ],
    "ChargeTypes": [
        {"ID": i, "ChargeTypeName": n} for i, n in
        [("1", "Tithe"), ("2", "Offering"), ("3", "Building Fund"), ("4", "Missions"), ("5", "Thanksgiving")]
    ],
    "Contributions": "Your contribution was received. Complete the M-Pesa prompt on your phone.",
    "PortalServiceTypes": [
        {"ID": "1", "Name": "Sunday Service"}, {"ID": "2", "Name": "Midweek Service"},
    ],
    "PortalChurchServices": [
        {"ID": str(i), "ServiceDescription": desc, "StartTime": s, "EndTime": e, "Capacity": c,
         "ServiceType": st, "Description": desc, "Name": desc, "ChurchServiceDate": f"{{{{date+{d}}}}} 12:00:00 AM"}
        for i, (desc, s, e, c, st, d) in enumerate([
            ("1st Service (English)", "7:30 AM", "9:00 AM", "300", "1", 0),
            ("2nd Service (English)", "9:30 AM", "11:00 AM", "300", "1", 0),
            ("3rd Service (Kiswahili)", "11:30 AM", "1:00 PM", "250", "1", 0),
            ("1st Service (English)", "7:30 AM", "9:00 AM", "300", "1", 7),
            ("2nd Service (English)", "9:30 AM", "11:00 AM", "300", "1", 7),
            ("Midweek Prayer", "6:00 PM", "7:30 PM", "150", "2", 3),
        ], 1)
    ],
    "PortalGetCompanyImage": IMG("logo", 400, 400),
    "PortalYoutubeVideoGallery": [
        {"Name": n, "Body": b, "VideoLink": YT(v), "DueDate": f"{{{{date-{d}}}}}"}
        for n, b, v, d in [
            ("Sunday Sermon", "Last Sunday's message.", "7oIAs-0G4mw", 3),
            ("Worship Highlights", "Praise and worship session.", "uv54ec8Pg1k", 10),
        ]
    ],
    "PortalEnquiryTypes": [
        {"ID": "1", "Name": "Prayer Request"}, {"ID": "2", "Name": "Counselling"},
        {"ID": "3", "Name": "Membership"}, {"ID": "4", "Name": "General Enquiry"},
    ],
    "PortalListOnboarding": [
        {"ID": "1", "Title": "Membership Class", "Description": "Four-week class for new members.",
         "ExpiryDate": "{{date+30}}", "IsChecked": "0", "AmountCharged": "0"},
        {"ID": "2", "Title": "Baptism", "Description": "Register for the next baptism Sunday.",
         "ExpiryDate": "{{date+45}}", "IsChecked": "0", "AmountCharged": "0"},
    ],
    "PortalDeviceFCMToken": "OK",
    # School-portal endpoints still declared by the API client
    "PortalStudentDetailedResults": [],
    "PortalGetProgressReport": [],
    "PortalStudentVisualization": [],
    "PortalStudentVisualizationAverage": [],
    "PortalStudentResults": [],
    # Legacy PORTAL_URL (.asmx) endpoints called through package:http
    "PortalAppGetPortalPhotoGallery": [
        {"AlbumID": a, "AlbumName": n, "AlbumDescription": desc, "AlbumType": "Photo",
         "AlbumPhotoCount": str(c),
         "Albumphotos": [{"ImageID": f"{a}{k}", "ImageLink": IMG(f"{a}-{k}"), "ImageHeight": "500", "ImageWidth": "800"}
                         for k in range(1, c + 1)]}
        for a, n, desc, c in [
            ("1", "Easter Sunday", "Easter celebration service.", 4),
            ("2", "Youth Camp", "Annual youth camp in Naivasha.", 5),
            ("3", "Community Outreach", "Medical camp and food drive.", 3),
        ]
    ],
    "PortalAppSavePortalApplications": {"200": "Your booking was received. See you at church!"},
}

for name, data in F.items():
    with open(os.path.join(out, name + ".json"), "w") as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
        f.write("\n")
print(len(F), "fixtures written to", out)
