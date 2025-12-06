# Exercise Manager - User Guide

Welcome to the Exercise Manager application! This guide will help you understand how to use all features of the application.

---

##  Table of Contents

1. [Accessing the Application](#accessing-the-application)
2. [Homepage Overview](#homepage-overview)
3. [Adding Exercises](#adding-exercises)
4. [Viewing Exercise Statistics](#viewing-exercise-statistics)
5. [Removing Exercises](#removing-exercises)
6. [BMI Calculator](#bmi-calculator)
7. [Data Persistence](#data-persistence)
8. [API Endpoints](#api-endpoints)

---

## 🌐 Accessing the Application

### Via Load Balancer (Recommended):
```
http://exercise-manager-alb-XXXXXXXXX.us-east-1.elb.amazonaws.com
```

### Via Direct Node Access:
```
http://<NODE_IP>:30080
```

---

##  Homepage Overview

When you first access the application, you'll see:

### Top Section:
- **Today's Date**: Current date displayed prominently
- **Exercise Statistics Cards**:
  -  Total number of exercises logged
  -  Total minutes of exercise
  -  Total calories burned

### Exercise Table:
A table displaying all your exercises with columns:
- **Exercise Name**: Type of exercise (e.g., Push-ups, Running)
- **Duration**: Time spent in minutes
- **Calories Burned**: Estimated calorie expenditure
- **Action**: Button to remove the exercise

### Forms Section:
- **Add New Exercise**: Form to log new exercises
- **BMI Calculator**: Tool to calculate BMI and get fitness advice

---

## ➕ Adding Exercises

### Steps:

1. **Locate the "Add a New Exercise" form** at the bottom of the page

2. **Fill in the required fields**:
   - **Exercise Name**: Enter the type of exercise (e.g., "Running", "Swimming", "Yoga")
   - **Duration (min)**: Enter how many minutes you exercised
   - **Calories Burned**: Enter estimated calories burned

3. **Click "Add Exercise"** button

4. **See your exercise** appear immediately in the table above

### Example:
```
Exercise Name: Running
Duration: 30 minutes
Calories: 300
```

---

##  Viewing Exercise Statistics

### Statistics Cards:

At the top of the homepage, you'll see three stat cards:

1. **Total Exercises**:
   - Shows count of all logged exercises
   - Updates automatically when you add/remove exercises

2. **Total Minutes**:
   - Sum of all exercise durations
   - Helps track your total workout time

3. **Total Calories**:
   - Sum of calories burned across all exercises
   - Great for tracking weight loss goals

### Exercise History Table:

The main table shows:
- All exercises in chronological order
- Quick overview of your fitness activity
- Easy access to remove any entry

---

##  Removing Exercises

### Steps:

1. **Find the exercise** you want to remove in the table

2. **Click the "Remove" button** next to that exercise

3. **Exercise is deleted** immediately

4. **Statistics update** automatically

**Note**: This action cannot be undone! The exercise will be permanently deleted from the database.

---

## BMI Calculator

### What is BMI?

BMI (Body Mass Index) is a measure of body fat based on height and weight. It helps determine if you're underweight, normal weight, overweight, or obese.

### How to Use:

1. **Locate the BMI Calculator** at the bottom of the page

2. **Enter your details**:
   - **Weight (kg)**: Your weight in kilograms
   - **Height (cm)**: Your height in centimeters

3. **Click "Calculate BMI"**

4. **View your results**:
   - Your calculated BMI number
   - Personalized calorie-burning advice

### BMI Categories & Advice:

| BMI Range | Category | Calorie Advice |
|-----------|----------|----------------|
| < 18.5 | Underweight | Light exercise recommended |
| 18.5 - 24.9 | Normal weight | Burn ~200-300 calories/day |
| 25.0 - 29.9 | Overweight | Aim for ~400-500 calories/day |
| ≥ 30.0 | Obese | Target ~500-700 calories/day |

### Example:
```
Weight: 70 kg
Height: 175 cm

Result:
BMI: 22.86
Advice: "Maintain your weight with ~200-300 calories burned per day."
```

---

##  Data Persistence

### How Your Data is Saved:

1. **Automatic Saving**:
   - Every time you add or remove an exercise, data is saved immediately
   - No manual "save" button needed

2. **Storage Location**:
   - Data stored in `/data/exercises.json` on NFS server
   - Shared across all application instances

3. **Data Persistence**:
   - Your data survives:
      Browser refresh
      Application restart
      Pod/container restart
      Server reboot
   - Data is lost only if:
      You manually delete exercises
      NFS server data is deleted
      Infrastructure is destroyed

### Dummy Data:

When the application starts for the first time, it loads dummy data:
- Push-ups: 15 min, 100 cal
- Squats: 20 min, 150 cal
- Plank: 10 min, 80 cal
- Running: 30 min, 300 cal
- Cycling: 45 min, 400 cal

You can remove these and add your own exercises!

---

## 🔌 API Endpoints

For developers or advanced users who want to integrate with the application:

### 1. Health Check
```bash
GET /health
```

**Response:**
```json
{
  "status": "healthy",
  "timestamp": "2025-12-06T12:00:00",
  "data_file": "/data/exercises.json",
  "data_file_exists": true
}
```

### 2. Get All Exercises
```bash
GET /api/exercises
```

**Response:**
```json
[
  {
    "name": "Running",
    "duration": 30,
    "calories": 300
  },
  {
    "name": "Push-ups",
    "duration": 15,
    "calories": 100
  }
]
```

### 3. Add Exercise
```bash
POST /api/exercises
Content-Type: application/json

{
  "name": "Yoga",
  "duration": 45,
  "calories": 200
}
```

**Response:**
```json
{
  "status": "success",
  "exercises": [...]
}
```

### 4. Calculate BMI (via form)
```bash
POST /
Form Data:
  - calculate_bmi: true
  - weight: 70
  - height: 175
```

---

## Tips & Best Practices

### For Best Experience:

1. **Regular Updates**: Log exercises immediately after workouts for accuracy

2. **Accurate Calories**: Use fitness trackers or calorie calculators for better estimates

3. **Consistent Units**: Always use the same unit system (kg/cm)

4. **BMI Limitations**: Remember that BMI is just one health indicator

5. **Track Progress**: Review your total statistics regularly to see improvement

### Common Use Cases:

**Daily Fitness Tracking**:
```
Morning: Log breakfast workout
Afternoon: Add lunch-time walk
Evening: Record gym session
```

**Weight Loss Goal**:
```
1. Calculate BMI
2. Note recommended daily calorie burn
3. Log all exercises
4. Track if you're meeting calorie goals
```

**Training Program**:
```
1. Pre-populate week's planned exercises
2. Update with actual performance
3. Monitor total duration and intensity
---

## 🎓 Learning Resources

Want to learn more about fitness tracking?

- [WHO BMI Guidelines](https://www.who.int/health-topics/obesity)
- [CDC Physical Activity Guidelines](https://www.cdc.gov/physicalactivity/)
- [Calorie Burn Calculator](https://www.calculator.net/calorie-calculator.html)

---

**Happy Tracking! 🏃‍♂️💪🔥**