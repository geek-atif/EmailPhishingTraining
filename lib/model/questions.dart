import '../../../ui/styles/images.dart';

class Question {
  final int id, answer;
  final String question, image;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.image,
      required this.answer,
      required this.options});
}

const List office365Qus = [
  {
    "id": 1,
    "question":
        "You receive an email from you one of your work colleague, sharing a file with you on Microsoft Sharepoint. What should you do first?",
    "image": "",
    "options": [
      'Click the document link',
      'Call the IT department',
      'Check sender’s full email address by hovering over or clicking it'
    ],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question": "Is this a Phishing Email ?",
    "image": Images.msOffice1,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question":
        "You receive an email from you one of your work colleague, sharing a file with you on Microsoft Sharepoint. What should you NOT do?",
    "image": "",
    "options": [
      'Immediately delete it',
      'Call the Sender to check if he/she sent the email',
      'Click the URL, attachment or link in the email',
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Is this a Phishing Email ?",
    "image": Images.msOffice2,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "How do you verify a button or link’s full URL in an email?",
    "image": "",
    "options": [
      'Click the button or Link',
      'Double-click the button or link',
      'Right click or hover over it'
    ],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "Is this a Phishing Email ?",
    "image": Images.msOffice3,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question":
        "How do Microsoft Office365 Phishing emails obtain your personal information?",
    "image": "",
    "options": [
      'Through a button in the email that takes you to a fake website',
      'Through a malicious attachment',
      'Through a link in the email that takes you to a fake website',
      'All of the above'
    ],
    "answer_index": 3,
  },
  {
    "id": 8,
    "question":
        "An urgent email from Microsoft telling you your Office 365 account has been deleted. How do you determine it’s a phishing scam or legitimate email?",
    "image": "",
    "options": [
      'Verify sender’s email, and any URL link in the email',
      'Call your colleague and ask him/her',
      'Report it to your administrator',
    ],
    "answer_index": 0,
  },
  {
    "id": 9,
    "question": "Is this a Phishing Email ?",
    "image": Images.msOffice4,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 1,
  },
  {
    "id": 10,
    "question":
        "If someone in your office falls for a Microsoft Office365 scams and provides his/her login and password, what could potentially happen? (c)",
    "image": "",
    "options": [
      'It would make the company executives mad',
      'IT department would call the police and have that person be arrested',
      'A hacker can infiltrate the company network, send malware or ransomware, steal valuable company data like customer list or intellectual property',
    ],
    "answer_index": 2,
  },
  {
    "id": 11,
    "question": "Is this a Phishing Email ?",
    "image": Images.msOffice5,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 0,
  },
  {
    "id": 12,
    "question":
        "An email from human resources asking you to login to your Oficce365 account and provide your bank information for the new payroll system. What will you do?",
    "image": "",
    "options": [
      'Immediately reply with whatever details you can provide',
      'Verify first if the email is legit by checking senders email &amp; then reaching out to human resources department to ensure it’s really them asking for it',
      'Take a copy of the payroll bank information form you filled out that has relevant info & send it'
    ],
    "answer_index": 1,
  },
  {
    "id": 13,
    "question":
        "What is correct way to identify and handle a Microsoft phishing scam?",
    "image": "",
    "options": [
      'Glance through to see what is being asked and if it looks reasonable do accordingly',
      'Do not click the URL link or attachment; Check the sender’s full email address; Verify full URL of the button or link; Check with sender if he/she sent the email before opening an attachment',
      'Check date and timestamp of the email. If that correct it not a phishing email'
    ],
    "answer_index": 1,
  },
  {
    "id": 14,
    "question":
        "What to do if you click a button or url link in a phishing scam email ?",
    "image": "",
    "options": [
      'Delete the email',
      'Power-down or unplug you computer to get rid of any malware',
      'Close the browser and delete any files that were downloaded'
    ],
    "answer_index": 2,
  },
];

const List phishingQuiz = [
  {
    "id": 1,
    "question": "Is this a Phishing Email ?",
    "image": Images.phisingemail,
    "options": ['Phishing Email', 'Real Email', 'No Answer'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "What are some of the signs of a phishing scam",
    "image": Images.pr1,
    "options": [
      'Nice graphics & layout',
      'Unknown sender, sense of urgency, unexpected link or attachment',
      'Personal information in the email',
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "What is the primary purpose of Phishing?",
    "image": "",
    "options": [
      'Annoy You',
      'Steal your personal information such as password, SSN and credit cards',
      'Flood your inbox so you can’t get any legitimate email',
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "What should you NOT do if an email looks suspicious?",
    "image": "",
    "options": [
      'Immediately delete it',
      'Report it to your administrator',
      'Click the URL, attachment or link in the email',
    ],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question":
        "An email from human resources asking to provide your detailed name, DOB, SSN and other personal information right away. What will you do?",
    "image": "",
    "options": [
      'Verify first if the email is legit by checking senders email & then reaching out to human resources department to ensure it’s really them asking for it',
      'Immediately reply with whatever details you can provide',
      'Take a copy of the human resource form you filled out that has relevant info & send it'
    ],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question":
        "All legitimate large companies send out emails asking for client’s personal information all the time, True or False?",
    "image": "",
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "What is quickest way to identify phishing email?",
    "image": "",
    "options": [
      'Glance through to see what is being asked',
      'Glance through to see what is being asked',
      'Check date and timestamp of the email'
    ],
    "answer_index": 1,
  },
  {
    "id": 8,
    "question":
        "What to do if you fall for a phishing scam and provide your email and password?",
    "image": "",
    "options": [
      'Delete the email',
      'Unplug computer to get rid of any malware',
      'Change your password immediately'
    ],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Is this a Phishing site or Real site?",
    "image": Images.ebay,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 0,
  },
  {
    "id": 10,
    "question": "Is this a Phishing site or Real site?",
    "image": Images.hsbc,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "Is this a Phishing site or Real site?",
    "image": Images.twitter,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 0,
  },
  {
    "id": 11,
    "question": "Is this a Phishing site or Real site?",
    "image": Images.americanair,
    "options": [
      'Phish',
      'Real',
    ],
    "answer_index": 0,
  },
];

const List phishingEmailGame = [
  {
    "id": 1,
    "question": "Is this a Phishing Email ?",
    "image": Images.first,
    "options": [
      'Phishing Email',
      'Real Email',
    ],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Is this a Phishing Email ?",
    "image": Images.second,
    "options": [
      'Phishing Email',
      'Real Email',
    ],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question": "Is this a Phishing Email ?",
    "image": Images.third,
    "options": [
      'Phishing Email',
      'Real Email',
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Is this a Phishing Email ?",
    "image": Images.fourth,
    "options": [
      'Phishing Email',
      'Real Email',
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Is this a Phishing Email ?",
    "image": Images.fifth,
    "options": [
      'Phishing Email',
      'Real Email',
    ],
    "answer_index": 0,
  },
];
