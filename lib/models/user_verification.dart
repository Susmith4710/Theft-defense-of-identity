// GET -> client/verification
import 'dart:convert';

class UserVerification {
  UserVerification({
    required this.transactionId,
    required this.quizId,
    required this.questions,
  });

static UserVerification verificationQuestionsFromJson(String str) =>
    UserVerification.fromJson(json.decode(str));
  
  String transactionId;
  String quizId;
  List<VerificationQuestion> questions;

  factory UserVerification.fromJson(Map<String, dynamic> json) =>
      UserVerification(
        transactionId: json["transactionId"],
        quizId: json["quizId"],
        questions: List<VerificationQuestion>.from(
            json["questions"].map((x) => VerificationQuestion.fromJson(x))),
      );
}

class VerificationQuestion {
  VerificationQuestion({
    required this.questionId,
    required this.text,
    required this.answers,
  });

  String questionId;
  String text;
  List<VerificationQuestionAnswer> answers;

  factory VerificationQuestion.fromJson(Map<String, dynamic> json) => VerificationQuestion(
        questionId: json["questionId"],
        text: json["text"],
        answers:
            List<VerificationQuestionAnswer>.from(json["answers"].map((x) => VerificationQuestionAnswer.fromJson(x))),
      );
}

class VerificationQuestionAnswer {
  VerificationQuestionAnswer({
    required this.answerId,
    required this.text,
  });

  String answerId;
  String text;

  factory VerificationQuestionAnswer.fromJson(Map<String, dynamic> json) => VerificationQuestionAnswer(
        answerId: json["answerId"],
        text: json["text"],
      );
}
