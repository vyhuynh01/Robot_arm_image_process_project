const int StepX = 2;
const int DirX = 5;
const int StepY = 3;
const int DirY = 6;
const int StepZ = 4;
const int DirZ = 7;
const int StepA = 12;
const int DirA = 13;
const int ENABLE = 8;
const int LSX = 9;
const int LSY = 10;
const int LSZ = 11;
const int LSA = A0;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

float Theta1, Theta2, Theta3;
float Theta1M, Theta2M, Theta3M, Color, SerialData;
float Theta1R, Theta2R, Theta3R;
float Theta1T, Theta2T, Theta3T;
float HomeX, HomeY, HomeZ, HomeA;
float Angle = 0.5;
float AngleA = 10.0;
float HieuChinh = 35.0;
float Distance = 30.0;
int wait = 20;
int count = 0, objectRemoved, tieptucchay;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void HamGripper(float Theta, int Status) {
  digitalWrite(DirA, Status);
  for (int x = 0; x < (Theta / 0.35) * 17; x++) {
    digitalWrite(StepA, 1);
    delayMicroseconds(500);
    digitalWrite(StepA, 0);
    delayMicroseconds(500);
  }
}

void HamMove(int Step, int Dir, float Theta, int Status) {
  digitalWrite(Dir, Status);
  for (int x = 0; x < (Theta / 0.1125) * 4.5; x++) {
    digitalWrite(Step, 1);
    delayMicroseconds(500);
    digitalWrite(Step, 0);
    delayMicroseconds(500);
  }
}

void HamDelay(uint32_t TimeNow, uint32_t TimeDelay) {
  uint32_t Time = millis();
  while (Time - TimeNow < TimeDelay)
    Time = millis();
}

void HOME() {
  while (digitalRead(LSX) == 1)
    HamMove(StepX, DirX, Angle, 0);
  while (digitalRead(LSY) == 1 and digitalRead(LSZ) == 1) {
    HamMove(StepY, DirY, Angle, 0);
    HamMove(StepZ, DirZ, Angle, 0);
  }
  while (digitalRead(LSY) == 1)
    HamMove(StepY, DirY, Angle, 0);
  while (digitalRead(LSZ) == 1)
    HamMove(StepZ, DirZ, Angle, 0);
}

void HOME_END() {
  while (digitalRead(LSY) == 1 and digitalRead(LSZ) == 1) {
    HamMove(StepY, DirY, Angle, 0);
    HamMove(StepZ, DirZ, Angle, 0);
  }
  while (digitalRead(LSY) == 1)
    HamMove(StepY, DirY, Angle, 0);
  while (digitalRead(LSZ) == 1)
    HamMove(StepZ, DirZ, Angle, 0);
  while (digitalRead(LSX) == 1)
    HamMove(StepX, DirX, Angle, 0);
}

void HomeGripper() {
  float Angle_Gripper;
  // while (digitalRead(LSA) == 1) {
  //   HamGripper(AngleA, 1);
  //   Serial.println("HomeGripper");
  //   HamDelay(millis(), wait);
  // }
  Angle_Gripper = (5.0 * 360.0) / 45.0;
  for (HomeA = AngleA; HomeA <= Angle_Gripper; HomeA += AngleA) {
    HamGripper(AngleA, 0);
    Serial.println("Gripper");
    HamDelay(millis(), wait);
  }
}

void HamTheta1() {
  Theta1R = Theta1M;
  if (round(Theta1R) == 0.0) {
    Theta1 = Theta1M;
    Serial.println("STEPX");
    Serial.println(Theta1);
    HamDelay(millis(), wait);
  } else {
    Theta1 = 0.0;
    for (HomeX = Angle; HomeX <= Theta1R; HomeX += Angle) {
      HamMove(StepX, DirX, Angle, 1);
      Theta1 = Theta1 + Angle;
      Serial.println("STEPX");
      Serial.println(Theta1);
      HamDelay(millis(), wait);
    }
  }
}

void HamTheta2() {
  Theta2R = abs(-130.0 - Theta2M);
  if (Theta2R == 0.0) {
    Theta2 = -130.0;
    Theta3 = 114.0;
    Serial.println("STEPY");
    Serial.println(Theta2);
    Serial.println("STEPZ");
    Serial.println(Theta3);
    HamDelay(millis(), wait);
  } else if (Theta2R > 0.0 && Theta2R <= 79.0) {
    for (HomeY = Angle; HomeY <= Theta2R; HomeY += Angle) {
      HamMove(StepY, DirY, Angle, 1);
      Theta2 = -130.0 + HomeY;
      Theta3 = 114.0 - HomeY;
      Serial.println("STEPY");
      Serial.println(Theta2);
      Serial.println("STEPZ");
      Serial.println(Theta3);
      HamDelay(millis(), wait);
    }
  } else {
    for (HomeY = Angle; HomeY <= 79.0; HomeY += Angle) {
      HamMove(StepY, DirY, Angle, 1);
      Theta2 = -130.0 + HomeY;
      Theta3 = 114.0 - HomeY;
      Serial.println("STEPY");
      Serial.println(Theta2);
      Serial.println("STEPZ");
      Serial.println(Theta3);
      HamDelay(millis(), wait);
    }
    Theta3R = abs(Theta2R - 79.0);
    for (HomeZ = Angle; HomeZ <= Theta3R; HomeZ += Angle) {
      HamMove(StepZ, DirZ, Angle, 1);
      Theta3 = 35.0 + HomeZ;
      Serial.println("STEPZ");
      Serial.println(Theta3);
      HamDelay(millis(), wait);
    }
    Theta2R = abs(Theta2R - 79.0);
    for (HomeY = Angle; HomeY <= Theta2R; HomeY += Angle) {
      HamMove(StepY, DirY, Angle, 1);
      Theta2 = -51.0 + HomeY;
      Theta3 = Theta3 - Angle;
      Serial.println("STEPY");
      Serial.println(Theta2);
      Serial.println("STEPZ");
      Serial.println(Theta3);
      HamDelay(millis(), wait);
    }
  }
}

void HamTheta3() {
  Theta3R = abs(Theta3M - Theta3);
  if (Theta3R == 0.0) {
    Theta3 = Theta3M;
    Serial.println("STEPZ");
    Serial.println(Theta3);
    HamDelay(millis(), wait);
  } else {
    for (HomeZ = Angle; HomeZ <= Theta3R; HomeZ += Angle) {
      HamMove(StepZ, DirZ, Angle, 1);
      Theta3 = Theta3 + Angle;
      Serial.println("STEPZ");
      Serial.println(Theta3);
      HamDelay(millis(), wait);
    }
  }
}

void HamTheta4(float Distance, int Status) {
  float Angle_Gripper;
  Angle_Gripper = (Distance * 360.0) / 45.0;
  for (HomeA = AngleA; HomeA <= Angle_Gripper; HomeA += AngleA) {
    HamGripper(AngleA, Status);
    Serial.println("Gripper");
    HamDelay(millis(), wait);
  }
}

void HamHieuChinh() {
  // for (HomeY = Angle; HomeY <= HieuChinh; HomeY += Angle) {
  //   HamMove(StepY, DirY, Angle, 0);
  //   Theta2 = Theta2M - HomeY;
  //   Theta3 = Theta3 + Angle;
  //   Serial.println("STEPY");
  //   Serial.println(Theta2);
  //   Serial.println("STEPZ");
  //   Serial.println(Theta3);
  //   HamDelay(millis(), wait);
  // }
  // for (HomeZ = Angle; HomeZ <= HieuChinh; HomeZ += Angle) {
  //   HamMove(StepZ, DirZ, Angle, 1);
  //   Theta3 = Theta3 - Angle;
  //   Serial.println("STEPZ");
  //   Serial.println(Theta3);
  //   HamDelay(millis(), wait);
  // }
  for (HomeY = Angle; HomeY <= HieuChinh; HomeY += Angle) {
    HamMove(StepY, DirY, Angle, 1);
    Theta2 = Theta2 + Angle;
    Theta3 = Theta3 - Angle;
    Serial.println("STEPY");
    Serial.println(Theta2);
    Serial.println("STEPZ");
    Serial.println(Theta3);
    HamDelay(millis(), wait);
  }
}

void HamRed() {
  Theta1M = 0.0;
  Theta2M = -40.0;
  Theta3M = 140.0;
  HamTheta2();
  HamTheta3();
  HamTheta1();
}

void HamGreen() {
  Theta1M = 20.0;
  Theta2M = -40.0;
  Theta3M = 140.0;
  HamTheta2();
  HamTheta3();
  HamTheta1();
}

void HamBlue() {
  Theta1M = 45.0;
  Theta2M = -40.0;
  Theta3M = 140.0;
  HamTheta2();
  HamTheta3();
  HamTheta1();
}

void HamRemoved() {
  objectRemoved = Serial.parseFloat();
  HamDelay(millis(), wait);
  objectRemoved = round(objectRemoved);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  pinMode(StepX, OUTPUT);
  pinMode(DirX, OUTPUT);
  pinMode(StepY, OUTPUT);
  pinMode(DirY, OUTPUT);
  pinMode(StepZ, OUTPUT);
  pinMode(DirZ, OUTPUT);
  pinMode(StepA, OUTPUT);
  pinMode(DirA, OUTPUT);
  pinMode(ENABLE, OUTPUT);

  pinMode(LSX, INPUT_PULLUP);
  pinMode(LSY, INPUT_PULLUP);
  pinMode(LSZ, INPUT_PULLUP);
  pinMode(LSA, INPUT_PULLUP);
  digitalWrite(ENABLE, 0);
  Serial.begin(9600);

  HOME();
  Serial.println("HOME");
}

void loop() {
  if (Serial.available() > 0) {

    // while (count == 2) {
     
    //   tieptucchay = Serial.parseFloat();
    //   HamDelay(millis(), wait);
    //   tieptucchay = round(tieptucchay);
    //   if (tieptucchay == 222.0) {
    //     count = 0;
    //     Serial.println("HOME");
    //     HamDelay(millis(), wait);
    //   delay(5000);
    //   break;
    //   }
    //   Serial.println("WAIT");
    //   HamDelay(millis(), wait); 
    // }

  
    while (count == 0) {
      Serial.println("WAIT");
      HamDelay(millis(), wait);
      tieptucchay = Serial.parseFloat();
      HamDelay(millis(), wait);
      tieptucchay = round(tieptucchay);
      if (tieptucchay == 222.0) {
        Serial.println("HOME");
        HamDelay(millis(), wait);
        // Thoát khỏi vòng lặp và tiếp tục với code sau đó
      }

      Theta1M = Serial.parseFloat();
      HamDelay(millis(), wait);
      Theta2M = Serial.parseFloat();
      HamDelay(millis(), wait);
      Theta3M = Serial.parseFloat();
      HamDelay(millis(), wait);
      Color = Serial.parseFloat();
      HamDelay(millis(), wait);
      SerialData = Serial.parseFloat();
      HamDelay(millis(), wait);

      Theta1M = round(Theta1M);
      Theta2M = round(Theta2M);
      Theta3M = round(Theta3M);
      Color = round(Color);
      SerialData = round(SerialData);

      if (SerialData == 555.0)
        count = 1;
    }

    while (count == 1) {
      HamTheta2();
      HamRemoved();
      if (objectRemoved == 999.0) {
        HOME();
     count=0;
        break;
      }
      HamTheta3();
      HamRemoved();
      if (objectRemoved == 999.0) {
        HOME();
     count=0;
        break;
      }
      HamTheta1();
      HamRemoved();
      if (objectRemoved == 999.0) {
        HOME();
     count=0;
        break;
      }

      HomeGripper();
      // HamRemoved();
    //   if (objectRemoved == 999.0) {
    //     HOME();
    //  count=0;
    //     break;
    //   }
      HamHieuChinh();
    //   HamRemoved();
    //   if (objectRemoved == 999.0) {
    //     HOME();
    //  count=0;
    //     break;
    //   }
      HamTheta4(Distance, 1);
    //   HamRemoved();
    //   if (objectRemoved == 999.0) {
    //     HOME();
    //  count=0;
    //     break;
    //   }
      HOME();
    //   HamRemoved();
    //   if (objectRemoved == 999.0) {
    //     HOME();
    //  count=0;
    //     break;
    //   }
      Serial.println("HOME_NEW");
      HamDelay(millis(), wait);

      if (Color == 1.0)
        HamRed();
      else if (Color == 2.0)
        HamGreen();
      else
        HamBlue();
      // HamRemoved();
    //   if (objectRemoved == 999.0) {
    //     HOME();
    //  count=0;
    //     break;
    //   }

      HamTheta4(Distance, 0);
      // HamRemoved();
    //   if (objectRemoved == 999.0) {
    //     HOME();
    //  count=0;
    //     break;
    //   }
      HOME_END();
      HamRemoved();
      if (objectRemoved == 999.0) {
        HOME();
     count=0;
        break;
      }
      Serial.println("END");
      HamDelay(millis(), wait);
      Serial.println("HOME");
      HamDelay(millis(), wait);
      count = 0;
      delay(8000);
    }
  }
}

