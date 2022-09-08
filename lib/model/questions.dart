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
        "The methods used by attackers to gain access to an Office 365 ______",
    "image": Images.office1,
    "options": [
      'Attacker sends a phishing email',
      'User clicks on link in the email',
      'User enters login credentials',
      'Microsoft has number of security'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question":
        "There are several steps you can take to further protect your email",
    "image": "",
    "options": [
      'Use multi-factor authentication',
      'Some machine-learning technologies',
      'Xyz multi-factor authentication',
      'Regular, mandated phishing exercises'
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Some machine-learning technologies can use local identity",
    "image": Images.office2,
    "options": ['Abx tr', 'Cbx tr', 'Mpbx tr', 'Pqwpbx tr'],
    "answer_index": 2,
  },
];

const List phishingQuiz = [
  {
    "id": 1,
    "question": "What is the primary purpose of Phishing?",
    "image": "",
    "options": [
      'Annoy You',
      'Steal your personal information such as password, SSN and credit cards<',
      'Flood your inbox so you can’t get any legitimate email'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "What should you NOT do if an email looks suspicious?",
    "image": "",
    "options": [
      'Immediately delete it',
      'Report it to your administrator',
      'Click the URL, attachment or link in the email'
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question":
        "An email from human resources asking to provide your detailed name, DOB, SNN and other personal information right away. What will you do?",
    "image": "",
    "options": [
      'Verify first if the email is legit by checking senders email & then reaching out to human resources department to ensure it’s really them asking forit',
      'Immediately reply with whatever details you can provide',
      'Take a copy of the human resource form you filled out that has relevant info & send it'
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question":
        "All legitimate large companies send out emails asking for client’s personal information all the time, True or False?",
    "image": "",
    "options": [
      'True',
      'False',
    ],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "What is quickest way to identify phishing email?",
    "image": "",
    "options": [
      'Glance through to see what is being asked',
      'Check the sender’s full email address including the domain',
      'Check date and timestamp of the email'
    ],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question":
        "What to do if you fall for a phishing scam an provide your email and password?",
    "image": "",
    "options": [
      'Delete the email',
      'Unplug computer to get rid of any malware',
      'Change your password immediately'
    ],
    "answer_index": 2,
  },
  {
    "id": 7,
    "question":
        "An email from human resources asking to provide your detailed name, DOB, SNN and other personal information right away. What will you do?",
    "image": "",
    "options": [
      'Verify first if the email is legit by checking senders email & then reaching out to human resources department to ensure it’s really them asking forit',
      'Immediately reply with whatever details you can provide',
      'Take a copy of the human resource form you filled out that has relevant info & send it'
    ],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "Is this a Phishing Email ?",
    "image": Images.phisingemail,
    "options": ['Phishing Email', 'Real Email', 'No Answer'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Is this a Phishing Email ?",
    "image": Images.phisingemail,
    "options": ['Phishing Email', 'Real Email', 'No Answer'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "What are some of the signs of a phishing scam ?",
    "image": Images.pr1,
    "options": [
      'Nice graphics & layout',
      'Unknown sender, sense of urgency, unexpected link or attachment',
      'Personal information in the email'
    ],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "Is this a Phishing Email ?",
    "image": Images.ebay,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 2,
  },
  {
    "id": 12,
    "question": "Is this a Phishing Email ?",
    "image": Images.hsbc,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 2,
  },
  {
    "id": 13,
    "question": "Is this a Phishing Email ?",
    "image": Images.twitter,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 2,
  },
  {
    "id": 13,
    "question": "Is this a Phishing Email ?",
    "image": Images.americanair,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 2,
  },
];

const List phishingEmailGame = [
  {
    "id": 1,
    "question": "Is this a Phishing Email ?",
    "image": Images.phisingemail,
    "options": ['Phishing Email', 'Real Email'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Is this a Phishing Email ?",
    "image": Images.phisingemail,
    "options": ['Phishing Email', 'Real Email'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Is this a Phishing Email ?",
    "image": Images.ebay,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 0,
  },
  {
    "id": 4,
    "question": "Is this a Phishing Email ?",
    "image": Images.hsbc,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Is this a Phishing Email ?",
    "image": Images.twitter,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Is this a Phishing Email ?",
    "image": Images.americanair,
    "options": [
      'Yes',
      'No',
    ],
    "answer_index": 0,
  },
];
