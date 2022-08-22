import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'theattackchain': 'The attack chain',
          'theattackchainOne':
              'The methods used by attackers to gain access to an Office 365 account are fairly straightforward. The phishing campaigns usually take the form of an email from Microsoft. The email contains a request to log in, claiming the user needs to reset their password, hasn’t logged in recently, or that there’s a problem with the account that needs their attention. A URL is included, enticing the reader to click to remedy the issue.',
          'theattackchainTwo':
              'The chain of events usually plays out like this:',
          'theattackchainSubOne':
              '1. Attacker sends a phishing email that appears to come from Microsoft or another trusted source.',
          'theattackchainSubTwo':
              '2. User clicks on link in the email, which brings them to a page mimicking the Office 365 login page.',
          'theattackchainSubThree':
              '3. User enters login credentials, which are scooped up by the attackers.',
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
              'Unless you initiated or requested something back, no legit company will send you an email with an attachment or URL Link for you to click. Do not click the URL link or attachment in such emails. If you accidently do, close browser and delete any downloaded files from your device.'
        },
        //sp LANGUAGE
        'es_ES': {},
      };
}
