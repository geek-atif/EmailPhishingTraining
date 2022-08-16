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
        },
        //sp LANGUAGE
        'es_ES': {},
      };
}
