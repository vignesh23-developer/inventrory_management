import 'customer_bills.dart';
import 'models.dart';

class DummyData {
  DummyData._();

  // ── Products ───────────────────────────────────────────────────────────────
  static final List<ProductModel> products = [
    const ProductModel(
      id: 'p1',
      name: 'HP LaserJet Pro',
      category: 'Electronics',
      description:
      'High-speed monochrome laser printer with wireless connectivity. Ideal for office environments with high print volume requirements.',
      price: 18500.00,
      stock: 24,
      minStock: 5,
      imageUrl: 'https://picsum.photos/seed/printer/400/300',
      sku: 'ELE-HP-001',
      unit: 'Piece',
    ),
    const ProductModel(
      id: 'p2',
      name: 'A4 Paper Ream 500 Sheets',
      category: 'Stationery',
      description: 'Premium quality A4 copier paper, 80 GSM, acid-free for sharp prints and long-lasting documents.',
      price: 280.00,
      stock: 3,
      minStock: 10,
      imageUrl: 'https://picsum.photos/seed/paper/400/300',
      sku: 'STA-A4-001',
      unit: 'Ream',
    ),
    const ProductModel(
      id: 'p3',
      name: 'Dell Monitor 24"',
      category: 'Electronics',
      description: 'Full HD IPS display with anti-glare coating, HDMI & DisplayPort, height-adjustable stand.',
      price: 14999.00,
      stock: 0,
      minStock: 3,
      imageUrl: 'https://picsum.photos/seed/monitor/400/300',
      sku: 'ELE-DL-002',
      unit: 'Piece',
    ),
    const ProductModel(
      id: 'p4',
      name: 'Mechanical Keyboard',
      category: 'Accessories',
      description: 'Tenkeyless RGB mechanical keyboard with blue switches, USB-C connectivity and N-key rollover.',
      price: 3499.00,
      stock: 42,
      minStock: 8,
      imageUrl: 'https://picsum.photos/seed/keyboard/400/300',
      sku: 'ACC-KB-003',
      unit: 'Piece',
    ),
    const ProductModel(
      id: 'p5',
      name: 'Ergonomic Office Chair',
      category: 'Furniture',
      description: 'Lumbar support, adjustable armrests, breathable mesh back. Supports up to 130 kg.',
      price: 12500.00,
      stock: 7,
      minStock: 4,
      imageUrl: 'https://picsum.photos/seed/chair/400/300',
      sku: 'FUR-CH-004',
      unit: 'Piece',
    ),
    const ProductModel(
      id: 'p6',
      name: 'USB-C Hub 7-in-1',
      category: 'Accessories',
      description: '4K HDMI, 3×USB 3.0, SD card reader, USB-C PD 100W pass-through.',
      price: 1299.00,
      stock: 65,
      minStock: 15,
      imageUrl: 'https://picsum.photos/seed/hub/400/300',
      sku: 'ACC-HUB-005',
      unit: 'Piece',
    ),
    const ProductModel(
      id: 'p7',
      name: 'Whiteboard 4×3 ft',
      category: 'Furniture',
      description: 'Magnetic dry-erase whiteboard with aluminium frame and accessory tray.',
      price: 3200.00,
      stock: 12,
      minStock: 3,
      imageUrl: 'https://picsum.photos/seed/whiteboard/400/300',
      sku: 'FUR-WB-006',
      unit: 'Piece',
    ),
    const ProductModel(
      id: 'p8',
      name: 'Wireless Mouse',
      category: 'Accessories',
      description: '2.4GHz nano receiver, 1600 DPI, silent click, 18-month battery life.',
      price: 899.00,
      stock: 88,
      minStock: 20,
      imageUrl: 'https://picsum.photos/seed/mouse/400/300',
      sku: 'ACC-MS-007',
      unit: 'Piece',
    ),
  ];

  // ── Customers ──────────────────────────────────────────────────────────────
  static final List<CustomerModel> customers = [
    CustomerModel(
      id: 'c1',
      name: 'Arjun Mehta',
      email: 'arjun.mehta@techcorp.in',
      phone: '+91 98456 12345',
      address: '42, MG Road, Bengaluru, Karnataka 560001',
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      joinedDate: DateTime(2023, 3, 15),
      totalSpent: 128500.00,
      totalOrders: 23,
    ),
    CustomerModel(
      id: 'c2',
      name: 'Priya Sharma',
      email: 'priya.sharma@designco.in',
      phone: '+91 97321 98765',
      address: '17, Anna Salai, Chennai, Tamil Nadu 600002',
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
      joinedDate: DateTime(2023, 6, 22),
      totalSpent: 74200.00,
      totalOrders: 14,
    ),
    CustomerModel(
      id: 'c3',
      name: 'Rahul Verma',
      email: 'rahul.v@startup.io',
      phone: '+91 99001 44532',
      address: '88, Bandra West, Mumbai, Maharashtra 400050',
      avatarUrl: 'https://i.pravatar.cc/150?img=15',
      joinedDate: DateTime(2024, 1, 8),
      totalSpent: 31600.00,
      totalOrders: 6,
    ),
    CustomerModel(
      id: 'c4',
      name: 'Sneha Pillai',
      email: 'sneha.p@infotech.co',
      phone: '+91 96214 77801',
      address: '5, Connaught Place, New Delhi 110001',
      avatarUrl: 'https://i.pravatar.cc/150?img=9',
      joinedDate: DateTime(2023, 11, 3),
      totalSpent: 96750.00,
      totalOrders: 18,
    ),
    CustomerModel(
      id: 'c5',
      name: 'Vikram Nair',
      email: 'vikram.nair@solutions.in',
      phone: '+91 91234 56789',
      address: '23, Jubilee Hills, Hyderabad, Telangana 500033',
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
      joinedDate: DateTime(2024, 2, 14),
      totalSpent: 18900.00,
      totalOrders: 4,
    ),
  ];

  // ── Bills ──────────────────────────────────────────────────────────────────
  static final List<BillModel> bills = [
    BillModel(
      id: 'b1',
      billNumber: 'INV-2024-001',
      customerId: 'c1',
      customerName: 'Arjun Mehta',
      createdAt: DateTime(2024, 11, 5),
      status: BillStatus.paid,
      discount: 10,
      items: const [
        BillItemModel(
          productId: 'p1',
          productName: 'HP LaserJet Pro',
          unit: 'Piece',
          quantity: 2,
          unitPrice: 18500,
        ),
        BillItemModel(
          productId: 'p4',
          productName: 'Mechanical Keyboard',
          unit: 'Piece',
          quantity: 5,
          unitPrice: 3499,
        ),
      ],
    ),
    BillModel(
      id: 'b2',
      billNumber: 'INV-2024-002',
      customerId: 'c2',
      customerName: 'Priya Sharma',
      createdAt: DateTime(2024, 11, 12),
      status: BillStatus.pending,
      discount: 5,
      items: const [
        BillItemModel(
          productId: 'p3',
          productName: 'Dell Monitor 24"',
          unit: 'Piece',
          quantity: 3,
          unitPrice: 14999,
        ),
        BillItemModel(
          productId: 'p8',
          productName: 'Wireless Mouse',
          unit: 'Piece',
          quantity: 3,
          unitPrice: 899,
        ),
      ],
    ),
    BillModel(
      id: 'b3',
      billNumber: 'INV-2024-003',
      customerId: 'c4',
      customerName: 'Sneha Pillai',
      createdAt: DateTime(2024, 11, 18),
      status: BillStatus.paid,
      items: const [
        BillItemModel(
          productId: 'p5',
          productName: 'Ergonomic Office Chair',
          unit: 'Piece',
          quantity: 6,
          unitPrice: 12500,
        ),
      ],
    ),
    BillModel(
      id: 'b4',
      billNumber: 'INV-2024-004',
      customerId: 'c3',
      customerName: 'Rahul Verma',
      createdAt: DateTime(2024, 12, 2),
      status: BillStatus.cancelled,
      items: const [
        BillItemModel(
          productId: 'p6',
          productName: 'USB-C Hub 7-in-1',
          unit: 'Piece',
          quantity: 10,
          unitPrice: 1299,
        ),
      ],
    ),
    BillModel(
      id: 'b5',
      billNumber: 'INV-2024-005',
      customerId: 'c5',
      customerName: 'Vikram Nair',
      createdAt: DateTime(2024, 12, 8),
      status: BillStatus.pending,
      discount: 8,
      items: const [
        BillItemModel(
          productId: 'p2',
          productName: 'A4 Paper Ream',
          unit: 'Ream',
          quantity: 50,
          unitPrice: 280,
        ),
        BillItemModel(
          productId: 'p7',
          productName: 'Whiteboard 4×3 ft',
          unit: 'Piece',
          quantity: 2,
          unitPrice: 3200,
        ),
      ],
    ),
  ];

  // ── Chart Data (monthly revenue) ─────────────────────────────────────────
  static final List<ChartData> monthlyRevenue = [
    const ChartData(label: 'Jul', value: 142000),
    const ChartData(label: 'Aug', value: 168000),
    const ChartData(label: 'Sep', value: 134000),
    const ChartData(label: 'Oct', value: 195000),
    const ChartData(label: 'Nov', value: 221000),
    const ChartData(label: 'Dec', value: 187000),
  ];

  // ── Category breakdown ────────────────────────────────────────────────────
  static final List<ChartData> categoryShare = [
    const ChartData(label: 'Electronics', value: 42),
    const ChartData(label: 'Accessories', value: 28),
    const ChartData(label: 'Furniture', value: 18),
    const ChartData(label: 'Stationery', value: 12),
  ];

  // ── Analytics cards ───────────────────────────────────────────────────────
  static final List<AnalyticsData> adminAnalytics = [
    const AnalyticsData(label: 'Total Revenue', value: 1047000, previousValue: 892000),
    const AnalyticsData(label: 'Total Orders', value: 65, previousValue: 51),
    const AnalyticsData(label: 'Products', value: 8, previousValue: 8),
    const AnalyticsData(label: 'Customers', value: 5, previousValue: 4),
  ];

  // ── Product Categories ────────────────────────────────────────────────────
  static const List<String> categories = [
    'All',
    'Electronics',
    'Accessories',
    'Furniture',
    'Stationery',
    'Other',
  ];

  // ── Product Requests ──────────────────────────────────────────────────────
  static final List<ProductRequestModel> productRequests = [
    ProductRequestModel(
      id: 'r1',
      customerId: 'c1',
      customerName: 'Arjun Mehta',
      productName: 'Standing Desk',
      quantity: 4,
      notes: 'Need height-adjustable models.',
      requestedAt: DateTime(2024, 12, 10),
      status: RequestStatus.pending,
    ),
    ProductRequestModel(
      id: 'r2',
      customerId: 'c2',
      customerName: 'Priya Sharma',
      productName: 'Webcam 4K',
      quantity: 2,
      notes: 'For video conferencing.',
      requestedAt: DateTime(2024, 12, 11),
      status: RequestStatus.approved,
    ),
  ];
}