<?php
session_start();
include 'db.php';

// Set the number of results per page
$results_per_page = 10; // Change this as needed

// Get the current page number from the URL, default to 1
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$start_from = ($page - 1) * $results_per_page;

// Handle search query
$search_query = '';
$search_term = '';
if (isset($_GET['search'])) {
    $search_term = $conn->real_escape_string($_GET['search']);
    $search_query = "AND m.prod_name LIKE '%$search_term%'";
}

// Handle sorting
$sort_column = 'm.prod_name'; // Default sort column
$sort_order = 'ASC'; // Default sort order

if (isset($_GET['sort'])) {
    if ($_GET['sort'] == 'name') {
        $sort_column = 'm.prod_name';
    } elseif ($_GET['sort'] == 'quantity') {
        $sort_column = 'i.quantity';
    } elseif ($_GET['sort'] == 'status') {
        $sort_column = "CASE 
                            WHEN i.quantity IS NULL THEN 2 
                            WHEN i.quantity <= i.threshold THEN 0 
                            ELSE 1 
                        END";
    }

    if (isset($_GET['order']) && $_GET['order'] == 'desc') {
        $sort_order = 'DESC';
    }
}

// Modified inventory query
$inventory_query = "SELECT m.prod_id, m.prod_name, i.quantity, i.threshold,
                    CASE 
                        WHEN i.quantity IS NULL THEN NULL
                        WHEN i.quantity <= i.threshold THEN 'Low Stock'
                        ELSE 'In Stock' 
                    END AS status
                    FROM product m
                    INNER JOIN inventory i ON m.prod_id = i.prod_id
                    WHERE m.prod_archive = 1 $search_query
                    ORDER BY $sort_column $sort_order, m.prod_name $sort_order
                    LIMIT $start_from, $results_per_page";


// Execute the inventory query
$inventory_result = $conn->query($inventory_query);

// Query to count total medicines for pagination
$count_query = "SELECT COUNT(*) as total FROM product m WHERE m.prod_archive = 1 $search_query";
$count_result = $conn->query($count_query);
$total_medicines = $count_result->fetch_assoc()['total'];
$total_pages = ceil($total_medicines / $results_per_page);

// Query to count medicines nearing expiry
$expiry_query = "SELECT COUNT(*) as near_expiry_count 
                 FROM batch 
                 WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)";
$expiry_result = $conn->query($expiry_query);
$near_expiry_count = $expiry_result->fetch_assoc()['near_expiry_count'];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/sidebar.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <style>
        .pagination .page-link {
            color: #007bff;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            color: white;
        }

        .pagination .page-item.disabled .page-link {
            color: #6c757d;
        }

        th a {
            color: black;
            /* Set the color of the table header text to black */
        }
    </style>
</head>

<body>
    <div class="content">
        <!-- Restock Modal -->
        <div class="modal fade" id="restockModal" tabindex="-1" aria-labelledby="restockModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="restockModalLabel">Restock Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="restockForm">
                            <div class="mb-3">
                                <label for="productId" class="form-label">Product ID</label>
                                <select class="form-select" id="productId" name="productId" required>
                                    <option value="">Select Product</option>
                                    <!-- Populate this with your product IDs -->
                                    <option value="1">Product 1</option>
                                    <option value="2">Product 2</option>
                                    <option value="3">Product 3</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="quantity" class="form-label">Quantity to Restock</label>
                                <input type="number" class="form-control" id="quantity" name="quantity" required>
                            </div>
                            <div class="mb-3">
                                <label for="expiryDate" class="form-label">Expiry Date</label>
                                <input type="date" class="form-control" id="expiryDate" name="expiryDate" required>
                            </div>
                            <div class="mb-3">
                                <label for="date" class="form-label">Date</label>
                                <input type="date" class="form-control" id="date" name="date" value="<?php echo date('Y-m-d'); ?>" required>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" form="restockForm">Restock</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-5">
            <div class="row mb-3">
                <div class="col-md-6">
                    <h2>Inventory</h2>
                </div>

                <div class="col-md-6">
                    <form method="GET" class="d-flex justify-content-end">
                        <button type="button" class="btn btn-outline-primary me-2" data-bs-toggle="modal" data-bs-target="#restockModal">RESTOCK</button>
                        <input type="text" name="search" placeholder="Search Product" class="form-control me-2" value="<?php echo htmlspecialchars($search_term); ?>">
                        <button type="submit" class="btn btn-outline-success me-2">Search</button>
                    </form>
                </div>
            </div>


            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th><a href="?page=<?php echo $page; ?>&search=<?php echo urlencode($search_term); ?>&sort=name&order=<?php echo ($sort_column == 'm.prod_name' && $sort_order == 'ASC') ? 'desc' : 'asc'; ?>">Product Name</a></th>
                        <th><a href="?page=<?php echo $page; ?>&search=<?php echo urlencode($search_term); ?>&sort=quantity&order=<?php echo ($sort_column == 'i.quantity' && $sort_order == 'ASC') ? 'desc' : 'asc'; ?>">Quantity in Stock</a></th>
                        <th><a href="?page=<?php echo $page; ?>&search=<?php echo urlencode($search_term); ?>&sort=status&order=<?php echo ($sort_column == 'status' && $sort_order == 'ASC') ? 'desc' : 'asc'; ?>">Status</a></th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $inventory_result->fetch_assoc()) { ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['prod_name']); ?></td>
                            <td><?php echo $row['quantity']; ?></td>
                            <td>
                                <?php
                                if (is_null($row['threshold'])) {
                                    echo ''; // No threshold set for this product
                                } elseif ($row['quantity'] <= $row['threshold']) {
                                    echo 'Low Stock'; // Quantity is below or equal to the threshold
                                } else {
                                    echo 'In Stock'; // Status if quantity is above the threshold
                                }
                                ?>
                            </td>
                            <td>
                                <a href="edit_medicine.php?prod_id=<?php echo $row['prod_id']; ?>" class="btn btn-info btn-sm" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>

            <!-- Pagination and Expiry Monitoring Button -->
            <div class="row justify-content-between align-items-center mt-3">
                <div class="col-auto">
                    <nav aria-label="Page navigation">
                        <ul class="pagination mb-0">
                            <?php if ($page > 1): ?>
                                <li class="page-item">
                                    <a class="page-link" href="?page=<?php echo $page - 1; ?>&search=<?php echo urlencode($search_term); ?>&sort=<?php echo $_GET['sort'] ?? 'name'; ?>&order=<?php echo $_GET['order'] ?? 'asc'; ?>" aria-label="Previous">
                                        <span aria-hidden="true">Previous</span>
                                    </a>
                                </li>
                            <?php else: ?>
                                <li class="page-item disabled">
                                    <a class="page-link"><span aria-hidden="true">Previous</span></a>
                                </li>
                            <?php endif; ?>

                            <?php for ($i = 1; $i <= $total_pages; $i++): ?>
                                <li class="page-item <?php echo $i == $page ? 'active' : ''; ?>">
                                    <a class="page-link" href="?page=<?php echo $i; ?>&search=<?php echo urlencode($search_term); ?>&sort=<?php echo $_GET['sort'] ?? 'name'; ?>&order=<?php echo $_GET['order'] ?? 'asc'; ?>"><?php echo $i; ?></a>
                                </li>
                            <?php endfor; ?>

                            <?php if ($page < $total_pages): ?>
                                <li class="page-item">
                                    <a class="page-link" href="?page=<?php echo $page + 1; ?>&search=<?php echo urlencode($search_term); ?>&sort=<?php echo $_GET['sort'] ?? 'name'; ?>&order=<?php echo $_GET['order'] ?? 'asc'; ?>" aria-label="Next">
                                        <span aria-hidden="true">Next</span>
                                    </a>
                                </li>
                            <?php else: ?>
                                <li class="page-item disabled">
                                    <a class="page-link"><span aria-hidden="true">Next</span></a>
                                </li>
                            <?php endif; ?>
                        </ul>
                    </nav>
                </div>

                <div class="col-auto">
                    <a href="expiry_monitoring.php" class="btn btn-warning">
                        Expiry Monitoring Tab
                        <span class="badge bg-danger"><?php echo $near_expiry_count; ?></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <?php include 'sidebar.php'; ?>
    <script src="jquery/jquery-3.7.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>