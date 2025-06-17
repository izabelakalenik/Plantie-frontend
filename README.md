# Plantie - Mobile Application for Detecting Plant Diseases

This project was developed as part of a master's level Scientific and Implementation Project course and was completed by a team of two.

## Overview

**Plantie** is a mobile application that uses artificial intelligence to identify plant diseases based on photos. It can assist users — such as gardeners, farmers, and hobbyists — in diagnosing problems with their plants and provide treatment recommendations.

## Features

- Capture or upload a photo of a plant leaf.
- Detect visible symptoms like spots, mold, discoloration, dryness, overwatering, or pests.
- Receive a prediction of the most probable disease and treatment suggestions.
- Fast and lightweight AI model with high accuracy (95.7%).
  
---

## How it works

The application uses a **Convolutional Neural Network (CNN)** trained on the [PlantVillage dataset](https://www.kaggle.com/datasets/emmarex/plantdisease) with over 50 classes, including healthy leaves and various plant diseases.

* [Backend repository](https://github.com/izabelakalenik/Plantie-backend)

### Model details

- **Base model:** RegNetY_400MF (pretrained on ImageNet)
- **Library:** PyTorch
- **Preprocessing:** Resized to 224x224 pixels
- **Training:** 10 epochs with early stopping (patience=3)

---

## Tech Stack

| Layer       | Technology |
|-------------|------------|
| Frontend    | Flutter    |
| Backend API | FastAPI + Python |
| AI Model    | PyTorch (CNN - RegNetY_400MF) |
| Dataset     | PlantVillage |

##

![image](https://github.com/user-attachments/assets/b9849016-ad8a-4c1c-9609-280f1f546e69)

