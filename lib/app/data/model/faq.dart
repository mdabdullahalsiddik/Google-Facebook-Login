class FAQModel {
  String? category;
  List<Faqs>? faqs;

  FAQModel({this.category, this.faqs});

  FAQModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faqs {
  String? sId;
  String? faqQuestionEnglish;
  String? faqQuestionBangla;
  String? faqAnswerEnglish;
  String? faqAnswerBangla;
  String? faqCategory;
  int? iV;

  Faqs({this.sId, this.faqQuestionEnglish, this.faqQuestionBangla, this.faqAnswerEnglish, this.faqAnswerBangla, this.faqCategory, this.iV});

  Faqs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    faqQuestionEnglish = json['faq_question_english'];
    faqQuestionBangla = json['faq_question_bangla'];
    faqAnswerEnglish = json['faq_answer_english'];
    faqAnswerBangla = json['faq_answer_bangla'];
    faqCategory = json['faq_category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['faq_question_english'] = this.faqQuestionEnglish;
    data['faq_question_bangla'] = this.faqQuestionBangla;
    data['faq_answer_english'] = this.faqAnswerEnglish;
    data['faq_answer_bangla'] = this.faqAnswerBangla;
    data['faq_category'] = this.faqCategory;
    data['__v'] = this.iV;
    return data;
  }
}
