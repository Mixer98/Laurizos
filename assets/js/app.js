const productCatalog = [
    {
        id: 1,
        sku: 'IPH-CASE-001',
        name: 'Funda MagSafe Velvet Amber',
        category: 'iphone',
        subcategory: 'fundas',
        price: 89000,
        compareAt: 109000,
        stock: 24,
        status: 'available',
        brand: 'Lauri Tech',
        supplier: 'Apple Partners',
        tags: ['magsafe', 'protección', 'antigolpes'],
        description: 'Funda premium con acabado mate, soporte MagSafe y protección de bordes reforzada.',
        images: ['/uploads/productos/iphone-case.svg', '/uploads/productos/iphone-case.svg', '/uploads/productos/iphone-case.svg'],
        variations: ['Color ámbar', 'Color arena', 'iPhone 14/15']
    },
    {
        id: 2,
        sku: 'IPH-CHG-002',
        name: 'Cargador inalámbrico Duo Charge',
        category: 'iphone',
        subcategory: 'cargadores',
        price: 139000,
        compareAt: 169000,
        stock: 16,
        status: 'available',
        brand: 'Lauri Tech',
        supplier: 'Electro Supply',
        tags: ['carga rápida', 'wireless', 'usb-c'],
        description: 'Base compacta para carga inalámbrica con superficie antideslizante y carga rápida.',
        images: ['/uploads/productos/magsafe-charger.svg', '/uploads/productos/magsafe-charger.svg'],
        variations: ['20W', 'Color café', 'USB-C']
    },
    {
        id: 3,
        sku: 'IPH-CBL-003',
        name: 'Cable trenzado Premium 1.5 m',
        category: 'iphone',
        subcategory: 'cables',
        price: 49000,
        compareAt: 59000,
        stock: 52,
        status: 'available',
        brand: 'Lauri Tech',
        supplier: 'Electro Supply',
        tags: ['cable', 'trenzado', 'durable'],
        description: 'Cable reforzado con conector Lightning y recubrimiento textil anti-ruptura.',
        images: ['/uploads/productos/braided-cable.svg'],
        variations: ['1.5 m', '2 m', 'Blanco cálido']
    },
    {
        id: 4,
        sku: 'IPH-GLS-004',
        name: 'Lámina de vidrio templado ProShield',
        category: 'iphone',
        subcategory: 'proteccion',
        price: 39000,
        compareAt: 49000,
        stock: 8,
        status: 'low',
        brand: 'Lauri Tech',
        supplier: 'Protect Lab',
        tags: ['vidrio templado', 'protector', 'pantalla'],
        description: 'Protector de pantalla con alta transparencia y recubrimiento oleofóbico.',
        images: ['/uploads/productos/tempered-glass.svg'],
        variations: ['iPhone 14', 'iPhone 15', 'Instalación fácil']
    },
    {
        id: 5,
        sku: 'CAB-COM-001',
        name: 'Set de peines wide-tooth glow',
        category: 'cabello',
        subcategory: 'peines',
        price: 36000,
        compareAt: 45000,
        stock: 44,
        status: 'available',
        brand: 'Laurizos Beauty',
        supplier: 'Beauty Line',
        tags: ['peine', 'curly girl', 'anti-frizz'],
        description: 'Set de peines anchos para desenredar sin romper la fibra capilar.',
        images: ['/public/wide-tooth-comb-set-curly-hair.png'],
        variations: ['2 piezas', '3 colores', 'Resistente al calor']
    },
    {
        id: 6,
        sku: 'CAB-MSK-002',
        name: 'Mascarilla hidratante repair jar',
        category: 'cabello',
        subcategory: 'tratamientos',
        price: 78000,
        compareAt: 92000,
        stock: 19,
        status: 'available',
        brand: 'Laurizos Beauty',
        supplier: 'Hair Care Co',
        tags: ['mascarilla', 'hidratación', 'nutrición'],
        description: 'Tratamiento profundo para rizos secos con brillo y control del frizz.',
        images: ['/public/hair-treatment-mask-jar.png'],
        variations: ['300 ml', '500 ml', 'Sin sulfatos']
    },
    {
        id: 7,
        sku: 'CAB-OIL-003',
        name: 'Aceite capilar amber glow',
        category: 'cabello',
        subcategory: 'serums',
        price: 52000,
        compareAt: 65000,
        stock: 27,
        status: 'available',
        brand: 'Laurizos Beauty',
        supplier: 'Hair Care Co',
        tags: ['aceite', 'brillo', 'sellado'],
        description: 'Aceite ligero para puntas abiertas y acabado luminoso sin sensación grasa.',
        images: ['/public/hair-oil-bottle-amber.png'],
        variations: ['50 ml', '100 ml', 'Coco y argán']
    },
    {
        id: 8,
        sku: 'CAB-DIF-004',
        name: 'Difusor universal para secador',
        category: 'cabello',
        subcategory: 'herramientas',
        price: 69000,
        compareAt: 89000,
        stock: 0,
        status: 'out',
        brand: 'Laurizos Beauty',
        supplier: 'Salon Supply',
        tags: ['difusor', 'secador', 'volumen'],
        description: 'Accesorio universal para secadores con flujo de aire distribuido y acabado profesional.',
        images: ['/public/hair-dryer-diffuser-attachment.png'],
        variations: ['Universal', 'Silicona', 'Negro arena']
    }
];

const ordersSeed = [
    { id: 'PED-1001', customer: 'Camila Pérez', status: 'Completado', total: 138000, payment: 'Tarjeta', date: '2026-07-04' },
    { id: 'PED-1002', customer: 'Sofía Gómez', status: 'En proceso', total: 87000, payment: 'PSE', date: '2026-07-08' },
    { id: 'PED-1003', customer: 'Laura Torres', status: 'Enviado', total: 214000, payment: 'Transferencia', date: '2026-07-10' }
];

const state = {
    search: '',
    category: 'all',
    stock: 'all',
    sort: 'featured',
    maxPrice: 250000,
    theme: localStorage.getItem('laurizos-theme') || 'light',
    cart: JSON.parse(localStorage.getItem('laurizos-cart') || '[]'),
    favorites: JSON.parse(localStorage.getItem('laurizos-favorites') || '[]'),
    orders: JSON.parse(localStorage.getItem('laurizos-orders') || '[]')
};

const currency = new Intl.NumberFormat('es-CO', { style: 'currency', currency: 'COP', maximumFractionDigits: 0 });

const dom = {
    html: document.documentElement,
    panels: [...document.querySelectorAll('.app-panel')],
    navButtons: [...document.querySelectorAll('[data-panel-target]')],
    themeToggle: document.getElementById('themeToggle'),
    search: document.getElementById('global-search'),
    categoryFilter: document.getElementById('categoryFilter'),
    stockFilter: document.getElementById('stockFilter'),
    priceSort: document.getElementById('priceSort'),
    priceRange: document.getElementById('priceRange'),
    priceRangeLabel: document.getElementById('priceRangeLabel'),
    catalogGrid: document.getElementById('catalogGrid'),
    featuredGrid: document.getElementById('featuredGrid'),
    favoritesGrid: document.getElementById('favoritesGrid'),
    cartItems: document.getElementById('cartItems'),
    cartSubtotal: document.getElementById('cartSubtotal'),
    cartTotal: document.getElementById('cartTotal'),
    cartCount: document.getElementById('cartCount'),
    favoritesCount: document.getElementById('favoritesCount'),
    checkoutBtn: document.getElementById('checkoutBtn'),
    checkoutModal: document.getElementById('checkoutModal'),
    confirmCheckout: document.getElementById('confirmCheckout'),
    productModal: document.getElementById('productModal'),
    modalBody: document.getElementById('modalBody'),
    ordersHistory: document.getElementById('ordersHistory'),
    adminStats: document.getElementById('adminStats'),
    adminProducts: document.getElementById('adminProducts'),
    adminOrders: document.getElementById('adminOrders')
};

function formatMoney(value) {
    return currency.format(value);
}

function saveState() {
    localStorage.setItem('laurizos-cart', JSON.stringify(state.cart));
    localStorage.setItem('laurizos-favorites', JSON.stringify(state.favorites));
    localStorage.setItem('laurizos-orders', JSON.stringify(state.orders));
    localStorage.setItem('laurizos-theme', state.theme);
}

function escapeHtml(value) {
    return String(value)
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');
}

function getStatusClass(status) {
    if (status === 'out') return 'out';
    if (status === 'low') return 'low';
    return 'available';
}

function getStatusLabel(status) {
    return status === 'out' ? 'Agotado' : status === 'low' ? 'Stock bajo' : 'Disponible';
}

function getVisibleProducts() {
    const query = state.search.trim().toLowerCase();
    let items = productCatalog.filter((product) => {
        const matchesSearch = !query || [product.name, product.sku, product.brand, product.tags.join(' ')]
            .join(' ')
            .toLowerCase()
            .includes(query);
        const matchesCategory = state.category === 'all' || product.category === state.category;
        const matchesStock = state.stock === 'all'
            || (state.stock === 'available' && product.status === 'available')
            || (state.stock === 'low' && product.status === 'low')
            || (state.stock === 'out' && product.status === 'out');
        const matchesPrice = product.price <= state.maxPrice;
        return matchesSearch && matchesCategory && matchesStock && matchesPrice;
    });

    if (state.sort === 'asc') {
        items = items.sort((a, b) => a.price - b.price);
    } else if (state.sort === 'desc') {
        items = items.sort((a, b) => b.price - a.price);
    }

    return items;
}

function renderProductCard(product) {
    const inCart = state.cart.find((item) => item.productId === product.id);
    const inFavorites = state.favorites.includes(product.id);
    return `
        <article class="product-card" data-product-card="${product.id}">
            <div class="product-media">
                <img src="${escapeHtml(product.images[0])}" alt="${escapeHtml(product.name)}">
            </div>
            <div class="product-body">
                <div>
                    <p class="product-meta">${escapeHtml(product.brand)} · ${escapeHtml(product.sku)}</p>
                    <h3 class="product-title">${escapeHtml(product.name)}</h3>
                </div>
                <p class="product-meta">${escapeHtml(product.subcategory)}</p>
                <strong class="product-price">${formatMoney(product.price)}</strong>
                <div class="pill-row">
                    <span class="pill ${getStatusClass(product.status)}">${getStatusLabel(product.status)}</span>
                    ${product.tags.slice(0, 2).map((tag) => `<span class="pill">${escapeHtml(tag)}</span>`).join('')}
                </div>
                <div class="product-actions">
                    <button class="mini-btn primary" data-add-cart="${product.id}" type="button">${inCart ? 'En carrito' : 'Agregar'}</button>
                    <button class="mini-btn" data-toggle-favorite="${product.id}" type="button">${inFavorites ? 'Quitar' : 'Favorito'}</button>
                </div>
                <button class="mini-btn" data-open-product="${product.id}" type="button">Ver detalle</button>
            </div>
        </article>
    `;
}

function renderCatalog() {
    const items = getVisibleProducts();
    dom.catalogGrid.innerHTML = items.map(renderProductCard).join('') || '<div class="card-surface">No se encontraron productos con esos filtros.</div>';
}

function renderFeatured() {
    const items = productCatalog.slice(0, 4);
    dom.featuredGrid.innerHTML = items.map((product) => `
        <article class="product-card">
            <div class="product-media">
                <img src="${escapeHtml(product.images[0])}" alt="${escapeHtml(product.name)}">
            </div>
            <div class="product-body">
                <h3 class="product-title">${escapeHtml(product.name)}</h3>
                <strong class="product-price">${formatMoney(product.price)}</strong>
                <button class="mini-btn primary" data-open-product="${product.id}" type="button">Detalle</button>
            </div>
        </article>
    `).join('');
}

function renderFavorites() {
    const items = productCatalog.filter((product) => state.favorites.includes(product.id));
    dom.favoritesGrid.innerHTML = items.length ? items.map(renderProductCard).join('') : '<div class="card-surface">Aún no tienes favoritos guardados.</div>';
}

function renderCart() {
    const items = state.cart.map((line) => {
        const product = productCatalog.find((entry) => entry.id === line.productId);
        if (!product) {
            return '';
        }
        return `
            <article class="cart-item">
                <img src="${escapeHtml(product.images[0])}" alt="${escapeHtml(product.name)}">
                <div>
                    <strong>${escapeHtml(product.name)}</strong>
                    <p class="muted">${escapeHtml(product.sku)} · ${formatMoney(product.price)}</p>
                </div>
                <div>
                    <strong>${line.quantity}</strong>
                </div>
            </article>
        `;
    }).join('');
    dom.cartItems.innerHTML = items || '<div class="card-surface">Tu carrito está vacío.</div>';

    const subtotal = state.cart.reduce((sum, line) => {
        const product = productCatalog.find((entry) => entry.id === line.productId);
        return sum + (product ? product.price * line.quantity : 0);
    }, 0);

    dom.cartSubtotal.textContent = formatMoney(subtotal);
    dom.cartTotal.textContent = formatMoney(subtotal + 12000);
    dom.cartCount.textContent = state.cart.reduce((sum, line) => sum + line.quantity, 0);
}

function renderOrders() {
    const history = state.orders.length ? state.orders : ordersSeed;
    dom.ordersHistory.innerHTML = history.map((order) => `
        <article class="history-item">
            <strong>${escapeHtml(order.id)}</strong>
            <span>${escapeHtml(order.customer)}</span>
            <span class="pill">${escapeHtml(order.status)}</span>
            <span>${formatMoney(order.total)}</span>
            <span class="muted">${escapeHtml(order.payment)} · ${escapeHtml(order.date)}</span>
        </article>
    `).join('');
}

function renderAdmin() {
    const revenue = state.orders.reduce((sum, order) => sum + order.total, 0) || ordersSeed.reduce((sum, order) => sum + order.total, 0);
    const availableProducts = productCatalog.filter((product) => product.status !== 'out').length;
    const totalStock = productCatalog.reduce((sum, product) => sum + product.stock, 0);
    const totalFavorites = state.favorites.length;

    dom.adminStats.innerHTML = [
        ['Productos', productCatalog.length],
        ['Disponibles', availableProducts],
        ['Favoritos', totalFavorites],
        ['Ventas', formatMoney(revenue)],
    ].map(([label, value]) => `
        <article class="admin-stat">
            <span class="muted">${label}</span>
            <strong>${value}</strong>
        </article>
    `).join('');

    dom.adminProducts.innerHTML = productCatalog.slice(0, 6).map((product) => `
        <tr>
            <td>${escapeHtml(product.sku)}</td>
            <td>${escapeHtml(product.name)}</td>
            <td>${escapeHtml(getStatusLabel(product.status))}</td>
            <td>${product.stock}</td>
        </tr>
    `).join('');

    const adminOrdersSource = state.orders.length ? state.orders : ordersSeed;
    dom.adminOrders.innerHTML = adminOrdersSource.map((order) => `
        <tr>
            <td>${escapeHtml(order.id)}</td>
            <td>${escapeHtml(order.customer)}</td>
            <td>${escapeHtml(order.status)}</td>
            <td>${formatMoney(order.total)}</td>
        </tr>
    `).join('');
}

function openModal(modal) {
    modal.classList.add('is-open');
    modal.setAttribute('aria-hidden', 'false');
    document.body.style.overflow = 'hidden';
}

function closeModal(modal) {
    modal.classList.remove('is-open');
    modal.setAttribute('aria-hidden', 'true');
    document.body.style.overflow = '';
}

function renderProductModal(productId) {
    const product = productCatalog.find((entry) => entry.id === productId);
    if (!product) {
        return;
    }
    const gallery = product.images.map((image, index) => `
        <button class="${index === 0 ? 'is-active' : ''}" data-gallery-image="${escapeHtml(image)}" type="button">
            <img src="${escapeHtml(image)}" alt="${escapeHtml(product.name)} ${index + 1}">
        </button>
    `).join('');

    dom.modalBody.innerHTML = `
        <div class="product-modal-grid">
            <div>
                <div class="gallery-main">
                    <img id="modalMainImage" src="${escapeHtml(product.images[0])}" alt="${escapeHtml(product.name)}">
                </div>
                <div class="gallery-thumbs">${gallery}</div>
            </div>
            <div class="product-details">
                <span class="eyebrow">${escapeHtml(product.category === 'iphone' ? 'iPhone accessories' : 'Hair accessories')}</span>
                <h3>${escapeHtml(product.name)}</h3>
                <p class="product-meta">SKU ${escapeHtml(product.sku)} · ${escapeHtml(product.brand)}</p>
                <strong class="product-price">${formatMoney(product.price)}</strong>
                <p>${escapeHtml(product.description)}</p>
                <div class="pill-row">
                    ${product.variations.map((variation) => `<span class="pill">${escapeHtml(variation)}</span>`).join('')}
                </div>
                <p class="availability ${getStatusClass(product.status)}">${getStatusLabel(product.status)} · ${product.stock} unidades</p>
                <div class="product-actions">
                    <button class="mini-btn primary" data-add-cart="${product.id}" type="button">Agregar al carrito</button>
                    <button class="mini-btn" data-toggle-favorite="${product.id}" type="button">Favorito</button>
                </div>
                <div class="muted">Productos relacionados preparados para la vista de catálogo y para integración con el backend.</div>
            </div>
        </div>
    `;

    openModal(dom.productModal);
}

function updateBadges() {
    dom.favoritesCount.textContent = state.favorites.length;
    dom.cartCount.textContent = state.cart.reduce((sum, line) => sum + line.quantity, 0);
}

function toggleFavorite(productId) {
    const index = state.favorites.indexOf(productId);
    if (index >= 0) {
        state.favorites.splice(index, 1);
    } else {
        state.favorites.push(productId);
    }
    saveState();
    renderFavorites();
    renderCatalog();
    renderFeatured();
    updateBadges();
    renderAdmin();
}

function addToCart(productId) {
    const existing = state.cart.find((item) => item.productId === productId);
    if (existing) {
        existing.quantity += 1;
    } else {
        state.cart.push({ productId, quantity: 1 });
    }
    saveState();
    renderCart();
    renderCatalog();
    renderFeatured();
    updateBadges();
}

function confirmCheckout() {
    const subtotal = state.cart.reduce((sum, line) => {
        const product = productCatalog.find((entry) => entry.id === line.productId);
        return sum + (product ? product.price * line.quantity : 0);
    }, 0);

    if (!subtotal) {
        return;
    }

    state.orders.unshift({
        id: `PED-${String(2000 + state.orders.length + 1).padStart(4, '0')}`,
        customer: 'Cliente web',
        status: 'Pendiente',
        total: subtotal + 12000,
        payment: 'Pendiente',
        date: new Date().toISOString().slice(0, 10)
    });
    state.cart = [];
    saveState();
    renderOrders();
    renderCart();
    renderAdmin();
    updateBadges();
    closeModal(dom.checkoutModal);
}

function bindPanelNavigation() {
    dom.navButtons.forEach((button) => {
        button.addEventListener('click', () => {
            const target = button.dataset.panelTarget;
            if (!target) {
                return;
            }

            dom.panels.forEach((panel) => panel.classList.toggle('is-active', panel.id === target));
            document.querySelectorAll('.navlink').forEach((navlink) => {
                navlink.classList.toggle('is-active', navlink.dataset.panelTarget === target);
            });
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    });
}

function bindCatalogEvents() {
    dom.search.addEventListener('input', (event) => {
        state.search = event.target.value;
        renderCatalog();
    });

    dom.categoryFilter.addEventListener('change', (event) => {
        state.category = event.target.value;
        renderCatalog();
    });

    dom.stockFilter.addEventListener('change', (event) => {
        state.stock = event.target.value;
        renderCatalog();
    });

    dom.priceSort.addEventListener('change', (event) => {
        state.sort = event.target.value;
        renderCatalog();
    });

    dom.priceRange.addEventListener('input', (event) => {
        state.maxPrice = Number(event.target.value) * 1000;
        dom.priceRangeLabel.textContent = `Hasta ${formatMoney(state.maxPrice)}`;
        renderCatalog();
    });

    document.addEventListener('click', (event) => {
        const addCart = event.target.closest('[data-add-cart]');
        const toggleFav = event.target.closest('[data-toggle-favorite]');
        const openProduct = event.target.closest('[data-open-product]');
        const closeModalTrigger = event.target.closest('[data-close-modal]');
        const galleryThumb = event.target.closest('[data-gallery-image]');

        if (addCart) {
            addToCart(Number(addCart.dataset.addCart));
        }

        if (toggleFav) {
            toggleFavorite(Number(toggleFav.dataset.toggleFavorite));
        }

        if (openProduct) {
            renderProductModal(Number(openProduct.dataset.openProduct));
        }

        if (closeModalTrigger) {
            [dom.productModal, dom.checkoutModal].forEach((modal) => closeModal(modal));
        }

        if (galleryThumb) {
            const mainImage = document.getElementById('modalMainImage');
            if (mainImage) {
                mainImage.src = galleryThumb.dataset.galleryImage;
            }
            document.querySelectorAll('[data-gallery-image]').forEach((button) => {
                button.classList.toggle('is-active', button === galleryThumb);
            });
        }
    });
}

function bindThemeToggle() {
    dom.themeToggle.addEventListener('click', () => {
        state.theme = state.theme === 'light' ? 'dark' : 'light';
        dom.html.dataset.theme = state.theme;
        saveState();
    });
}

function bindCheckout() {
    dom.checkoutBtn.addEventListener('click', () => openModal(dom.checkoutModal));
    dom.confirmCheckout.addEventListener('click', confirmCheckout);
}

function init() {
    dom.html.dataset.theme = state.theme;
    bindPanelNavigation();
    bindCatalogEvents();
    bindThemeToggle();
    bindCheckout();

    renderFeatured();
    renderCatalog();
    renderFavorites();
    renderCart();
    renderOrders();
    renderAdmin();
    updateBadges();

    dom.priceRangeLabel.textContent = `Hasta ${formatMoney(state.maxPrice)}`;
    if (window.lucide) {
        window.lucide.createIcons();
    }
}

document.addEventListener('DOMContentLoaded', init);