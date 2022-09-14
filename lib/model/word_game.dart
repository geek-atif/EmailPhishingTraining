class WordGame {
  final int id;
  final String question;
  final String answer;
  final String hint;

  WordGame(
      {required this.id,
      required this.question,
      required this.answer,
      required this.hint});

  static const List wordGameOne = [
    {
      "id": 1,
      "question": "hipshing",
      "answer": "phishing",
      "hint": "the most widely used email-based cyber attack technique",
    },
    {
      "id": 2,
      "question": "sender-email",
      "answer": "mender-smail",
      "hint": "the quickest way to identify phishing email is to check ___"
    },
    {
      "id": 3,
      "question": "password",
      "answer": "password",
      "hint": "the primary purpose of Phishing is to steal __",
    },
    {
      "id": 4,
      "question": "https",
      "answer": "https",
      "hint":
          "Look for ___ in the URL to check if website is encrypted before entering any data like username or password",
    },
    {
      "id": 5,
      "question": "fake-website",
      "answer": "fake-website",
      "hint": "How do Phishing emails obtain your personal information?",
    },
    {
      "id": 6,
      "question": "click-links",
      "answer": "click-links",
      "hint": "What should you not do if an email looks suspicious?",
    },
    {
      "id": 7,
      "question": "check-sender",
      "answer": "check-sender",
      "hint": "What should you do if an email look suspicious?",
    },
    {
      "id": 8,
      "question": "never",
      "answer": "never",
      "hint":
          "If the sender’s email address has unrecognizable domain, is that email ever legit?",
    },
    {
      "id": 9,
      "question": "urgency",
      "answer": "urgency",
      "hint": "Phishing email’s subject typically conveys ____",
    },
    {
      "id": 10,
      "question": "importance",
      "answer": "importance",
      "hint": "Phishing email’s subject typically conveys ____",
    },
    {
      "id": 11,
      "question": "attention",
      "answer": "attention",
      "hint": "Phishing email’s subject typically conveys ____",
    },
    {
      "id": 12,
      "question": "subject",
      "answer": "subject",
      "hint":
          "Invariably, the email address in phishing email will not have domain name that reflects the email’s ____",
    },
    {
      "id": 13,
      "question": "verify",
      "answer": "verify",
      "hint":
          "You receive an email from Microsoft that your account is expired, ___ with your IT Admin first before clicking any links",
    },
    {
      "id": 14,
      "question": "attachment",
      "answer": "attachment",
      "hint": "Phishing email language prods you to click the ___ in the email",
    },
    {
      "id": 15,
      "question": "smishing",
      "answer": "smishing",
      "hint": "Text message from IRS or your bank, is a form of ___",
    },
    {
      "id": 16,
      "question": "domain",
      "answer": "domain",
      "hint":
          "Smishing is the same as phishing email with a bad URL, so check the ____ before clicking the URL",
    },
    {
      "id": 17,
      "question": "hover",
      "answer": "hover",
      "hint":
          "To see the full email address of the sender, click once or on some systems click twice or __",
    },
  ];
}
