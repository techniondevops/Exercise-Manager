from functions import *

def main():
    exercises = []

    print("🏋️ Welcome to Exercise Manager 🏋️")
    while True:
        print("\nMenu:")
        print("1. Add exercise")
        print("2. Remove exercise")
        print("3. Edit exercise")
        print("4. View all exercises")
        print("5. Sort exercises")
        print("6. Total calories burned")
        print("0. Exit")

        choice = input("Choose an option: ").strip()

        if choice == "1":
            add_exercise(exercises)
        elif choice == "2":
            remove_exercise(exercises)
        elif choice == "3":
            edit_exercise(exercises)
        elif choice == "4":
            display_exercises(exercises)
        elif choice == "5":
            sort_exercises(exercises)
        elif choice == "6":
            total_calories(exercises)
        elif choice == "0":
            print("Goodbye!")
            break
        else:
            print("❌ Incorrect choice, please try again.")

if __name__ == "__main__":
    main()