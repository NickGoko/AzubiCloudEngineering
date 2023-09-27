# Azubi store has products that customers love. Below are the products, prices and the number of customers that purchased products last week.

# The owner wants you to do some calculations on the data with these criteria's:

products = ["Sankofa Foods", "Jamestown Coffee", "Bioko Chocolate", "Blue Skies Ice Cream", "Fair Afric Chocolate", "Kawa Moka Coffee", "Aphro Spirit", "Mensado Bissap", "Voltic"]
prices = [30, 25, 40, 20, 20, 35, 45, 50, 35]
last_week = [2, 3, 5, 8, 4, 4, 6, 2, 9]

# Calculate the total price average for all products
average_price = sum(prices) / len(prices)

# Create a new price list that reduces the old prices by $5. 
new_prices = [price - 5 for price in prices]

# Calculate the total revenue generated from the products
total_revenue = sum([price * customers for price, customers in zip(prices, last_week)])

# Calculate the average daily revenue generated from the products
average_daily_revenue = total_revenue / sum(last_week)

# Determine which products are less than $30 based on the new prices
affordable_products = []

for i in range(len(products)):
    if new_prices[i] < 30:
        affordable_products.append(products[i])


# Print the results
print(f"Average Price: ${average_price:.1f}")
print(f"New Prices: {new_prices}")
print(f"Total Revenue: ${total_revenue:.2f}")
print(f"Average Daily Revenue: ${average_daily_revenue:.2f}")
print(f"Affordable Products: {affordable_products}")


# Create a dictionary with products as keys and prices as values
product_prices_dict = {product: price for product, price in zip(products, prices)}

# Now product_prices_dict contains the desired dictionary
