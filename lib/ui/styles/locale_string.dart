import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'theattackchain':
              'Subject contains Account Related Error : Account Deactivated, Expired or other errors',
          'theattackchainOne':
              'The methods used by attackers to gain access to an Office 365 account are fairly straightforward. The phishing campaigns usually take the form of an email from Microsoft. The email contains a request to log in, claiming the user needs to reset their password, hasn’t logged in recently, or that there’s a problem with the account that needs their attention. A URL is included, enticing the reader to click to remedy the issue.',
          'theattackchainTwo':
              'The chain of events usually plays out like this:',
          'theattackchainSubOne':
              '(i) Typically this type of phishing scam will have a Subject line that will point to account deactivation, account expiry, too many login attempt detected or such account related error.',
          'theattackchainSubTwo':
              '(ii) See an example of such email in the image on the side',
          'theattackchainSubThree':
              "(iii) Steps to detect this type of Phishing Scam Click on the Sender’s Email address or hover over it. While it may contain Microsoft or Microsoft Office – the domain name will not end in microsoft.com Hover over the Login Link provided in the email and you will notice again that the URL will not be a Microsoft url that ends with “microsoft.com” Most likely the URL will also not begin with https:// ",
          'theattackchainSubFour':
              "(iv) Tip: When in doubt, contact your IT system administrator to verify if your account indeed has been expired, deactivated or in jeopardy of deactivation. You can also forward a copy of the scam email to them for further review and filtering of such messages from other users mailboxes.",
          'microsoftHead':
              'Microsoft has number of security technologies into its Office 365 offerings',
          'microsoftSubHead':
              'There are several steps you can take to further protect your email:',
          'microsoftSubHeadOne': '1. Use multi-factor authentication:',
          'microsoftSubBodyOne':
              'If a login attempt requires a secondary authorization before someone is allowed access to an inbox, this will stop many attackers, even with phished credentials.',
          'microsoftSubHeadTwo':
              '2. Deploy advanced anti-phishing technologies:',
          'microsoftSubBodyTwo':
              ' Some machine-learning technologies can use local identity and relationship modeling alongside behavioral analytics to spot deception-based threats.',
          'microsoftSubHeadThree': '3. Run regular phishing exercises:',
          'microsoftSubBodyThree':
              'Regular, mandated phishing exercises across the entire organization will help to train employees to recognize phishing emails, so that they don’t click on malicious URLs, or enter their credentials into malicious websites. For instance, Duo offers a free phishing simulation tool, called Duo Insight.',
          'phishingOne':
              'Subject and email body the first give-away of a malicious email is the subject line which typically tries to convey urgency, importance and attention. Any UNSOLICITED email that has subject with words such as “you have won”, “account expired”, “credit card declined”, “your UPS/Fedex order #”, “note to self” and others that look to have suspicious subject line should not be opened. Another give away to look for is Unsolicited emails with email body which contain poor grammatically structured sentences.',
          'phishingOneNote':
              'No legitimate company sends emails to solicit account, password or any other personal information.',
          'phishingTwo':
              'Sender’s email address If the email Subject or body seems suspicious then, next thing is to look at the Sender’s email address. Click on the Sender’s emails once or on some devices, twice and a pop-up will show the details of the sender’s email. Invariably, the email address will not have domain name that reflects the email’s subject or message.',
          'phishingTwoNote': 'No legit email will have unrecognizable domain.',
          'phishingThree':
              'Attachments or URL links in the email body Another common characteristic of malicious emails is either having an attachment (pdf, word or other common formats) OR a URL Link that the email prods you to click.',
          'phishingThreeNote':
              'Unless you initiated or requested something back, no legit company will send you an email with an attachment or URL Link for you to click. Do not click the URL link or attachment in such emails. If you accidently do, close browser and delete any downloaded files from your device.',
          'nondeliveredEmailsOne':
              "(i) These types of scams will have Subject that says “Your messages have not been delivered” or “Last email message was not delivered",
          'nondeliveredEmailsTwo':
              "(ii) In the body of the email you will find something like “Microsoft Office found several undelivered messages”. It will then have “Send Again” or “Resend Message” button",
          'nondeliveredEmailsThree':
              "(iii) Steps to detect this type of Phishing Scam are the same as above",
          'nondeliveredEmailsFour':
              " Note the Sender’s Email address. While it may contain Microsoft or Microsoft Office – the domain name will not end in “microsoft.com”",
          'nondeliveredEmailsFive':
              "Hover over the “Send Again” or “Resend Message” button in the email and you will notice again that the URL will not be a Microsoft url that ends with “microsoft.com”",
          'office365One':
              "(i) A common Microsoft SharePoint scam is related to email message that indicates SharePoint quota exceeded or File Size too large or other File related errors.",
          'office365Two':
              "(ii) Similar to Account deactivated or account expired type of scam above, in this scam the scammer uses SharePoint Support as the sender name to try to entice you to take action. There typically would be a button in the email to “Request Quota Increase” or “Resend File”",
          'office365Three':
              "(iii) Steps to detect this type of Phishing Scam are the same as above two scams",
          'sharepointOne':
              "(i) In this scam, the email will indicate either coming from Microsoft Office365 or Microsoft SharePoint with a subject line indicating that someone has shared a document with you.",
          'sharepointTwo':
              "(ii) It will have a SharePoint link or a pdf of a document that the email sender asks you to review and edit or collaborate on.",
          'sharepointThree':
              "(iii)If there is a shared document link, it’ll look like a Microsoft OneDrive shared document",
          'sharepointFour':
              "(iv) If there is a pdf attachment, it most likely points to a malware",
          'sharepointFive': "(v)Steps to detect this type of Phishing Scam",
          'sharepointSix':
              "You should note the sender’s email address. However, unlike the other scams above, the email may come from a compromised company account or a known sender account. Therefore, do not rely only on verifying sender’s email Hover over the Login Link provided in the email and you will notice again that the URL will not be a Microsoft url that ends with “microsoft.com” or “onedrive.com”",
          'sharepointSeven':
              "If it has a pdf attachment, the sender email address looks legit and you are not expecting a shared document from that sender, it is strongly recommended that you contact the sender directly to ask if they have shared the document with you. Only open such attachment after confirming with the sender.",
        },
        //sp LANGUAGE
        'es_ES': {},
      };
}
