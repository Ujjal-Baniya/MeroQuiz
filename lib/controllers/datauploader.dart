import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:meroquiz/firebase_ref/loadingStatus.dart';
import 'package:meroquiz/firebase_ref/references.dart';
import 'package:meroquiz/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingstatus = loadingStatus.loading.obs; // Loading Status observeable

  Future<void> uploadData() async {
    loadingstatus.value = loadingStatus.loading; //0
    final firestore = FirebaseFirestore.instance;
    print("data is uploading ");
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // Load json file and path
    final pappersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();

    List<QuestionPaperModel> questionPapers = [];

    for (var paper in pappersInAssets) {
      String StringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(StringPaperContent)));

      var batch = firestore.batch();

      for (var paper in questionPapers) {
        batch.set(questionPaperRF.doc(paper.id), {
          "title": paper.title,
          "image_url": paper.imageUrl,
          "description": paper.Description,
          "time_seconds": paper.timeSeconds,
          "questions_count":
              paper.questions == null ? 0 : paper.questions.length,
        });

        for (var questions in paper.questions) {
          final questionPath =
              questionRF(paperId: paper.id, questionId: questions.id);
          batch.set(questionPath, {
            "question": questions.question,
            "correct_answer": questions.correctAnswer,
          });
          for (var answer in questions.answers) {
            batch.set(
                questionPath.collection("answers").doc(answer.identifier), {
              "identifier": answer.identifier,
              "Answer": answer.Answer,
            });
          }
        }
      }

      await batch.commit();
      loadingstatus.value = loadingStatus.completed;
    }
  }
}
