
food_charge = float(input("Enter the charge for food: $"))


tip = 0.18 * food_charge

sales_tax = 0.07 * food_charge

total = food_charge + tip + sales_tax

# Display the results
print(f"Tip = ${tip}")
print(f"Sales tax = ${sales_tax}")
print(f"Grand total = ${total}")
