-- Insert users
INSERT INTO users (fb_uid, email, name, avatar_url, phone_number)
VALUES
('fb_123', 'juan.perez@example.com', 'Juan Pérez', 'https://example.com/avatars/juan.jpg', '+50255551234'),
('fb_456', 'ana.gomez@example.com', 'Ana Gómez', 'https://example.com/avatars/ana.jpg', '+50255556789'),
('fb_789', 'carlos.lopez@example.com', 'Carlos López', NULL, '+50255559876'),
('fb_321', 'mariana.ramirez@example.com', 'Mariana Ramírez', 'https://example.com/avatars/mariana.jpg', NULL),
('fb_654', 'luis.mendez@example.com', 'Luis Méndez', NULL, '+50255554321');

-- Insert business categories
INSERT INTO business_categories (name, slug, description, icon_url)
VALUES
('Restaurantes', 'restaurantes', 'Comida típica, internacional y más.', 'https://example.com/icons/restaurant.svg'),
('Tecnología', 'tecnologia', 'Negocios tecnológicos y servicios digitales.', 'https://example.com/icons/tech.svg'),
('Moda', 'moda', 'Ropa, accesorios y más.', 'https://example.com/icons/fashion.svg'),
('Educación', 'educacion', 'Instituciones educativas y tutorías.', 'https://example.com/icons/education.svg'),
('Salud', 'salud', 'Clínicas, farmacias y más.', 'https://example.com/icons/health.svg');

-- Insert business profiles
INSERT INTO business_profiles (
    user_id, category_id, name, slug, description, short_description, logo_url,
    phone_number, email, website_url, address, business_hours
)
VALUES
(1, 1, 'Comedor Doña Lety', 'comedor-dona-lety', 'Comida casera tradicional guatemalteca.', 'Sabores de casa en cada plato.', 'https://example.com/logos/donalety.png', '+50255551234', 'dona.lety@ejemplo.com', 'https://donalety.gt', '4a Calle 5-67, Zona 1, Ciudad de Guatemala', '{"mon-fri": "08:00-18:00", "sat": "08:00-14:00"}'),
(2, 2, 'TechNova', 'technova', 'Desarrollo de software y soporte IT.', 'Soluciones tecnológicas a tu medida.', 'https://example.com/logos/technova.png', '+50255556789', 'contacto@technova.gt', 'https://technova.gt', 'Edificio Avante, Zona 10', '{"mon-fri": "09:00-17:00"}'),
(3, 3, 'Estilo Urbano', 'estilo-urbano', 'Ropa urbana y accesorios modernos.', 'Viste con actitud.', 'https://example.com/logos/urbano.png', '+50255554321', 'info@estilourbano.gt', NULL, 'Centro Comercial Miraflores', '{"mon-sun": "10:00-20:00"}'),
(4, 4, 'Academia Alfa', 'academia-alfa', 'Clases particulares y reforzamiento escolar.', 'Tu aliado académico.', 'https://example.com/logos/alfa.png', NULL, 'alfa@academia.gt', NULL, 'Zona 11, Ciudad de Guatemala', '{"mon-sat": "08:00-17:00"}'),
(5, 5, 'Clínica Vida Sana', 'clinica-vida-sana', 'Atención médica familiar.', 'Tu salud, nuestra prioridad.', NULL, '+50255550999', 'info@vidasana.gt', 'https://vidasana.gt', 'Calzada Roosevelt, Zona 7', '{"mon-fri": "08:00-16:00"}');

-- Insert business social links
INSERT INTO business_social_links (business_id, platform, url)
VALUES
(1, 'facebook', 'https://facebook.com/comedordonalety'),
(2, 'instagram', 'https://instagram.com/technova.gt'),
(3, 'twitter', 'https://twitter.com/estilo_urbano'),
(4, 'whatsapp', 'https://wa.me/50255512345'),
(5, 'facebook', 'https://facebook.com/clinica.vidasana');

-- Insert announcements
INSERT INTO announcements (business_id, title, content, expires_at)
VALUES
(1, '¡Menú especial del día!', 'Hoy tenemos Pepián con arroz por solo Q25.', NOW() + INTERVAL '2 days'),
(2, 'Curso de Python disponible', 'Inscripciones abiertas para nuestro curso intensivo.', NOW() + INTERVAL '10 days'),
(3, 'Descuento de temporada', 'Toda la ropa de invierno con 30% de descuento.', NOW() + INTERVAL '7 days'),
(5, 'Vacuna contra la gripe', 'Disponible sin cita previa esta semana.', NOW() + INTERVAL '5 days'),
(4, 'Clases en línea', 'Ya puedes tomar nuestras clases desde casa.', NOW() + INTERVAL '15 days');

-- Insert announcement replies
INSERT INTO announcement_replies (announcement_id, user_id, commenter_name, message)
VALUES
(1, 2, 'Ana Gómez', '¡Qué rico! ¿También hay tortillas hechas a mano?'),
(2, 3, 'Carlos López', '¿Cuánto cuesta el curso?'),
(3, 1, 'Juan Pérez', '¿También hay para niños?'),
(5, 4, 'Mariana Ramírez', '¿Atienden los sábados?'),
(4, NULL, 'Visitante', '¿Las clases en línea tienen horario fijo?');

-- Insert announcement reactions to announcements
INSERT INTO announcement_reactions (announcement_id, user_id, reaction_type)
VALUES
(1, 2, 'like'),
(2, 3, 'wow'),
(3, 1, 'love');

-- Insert announcement reactions to replies
INSERT INTO announcement_reactions (reply_id, user_id, reaction_type)
VALUES
(1, 1, 'like'),
(4, 2, 'sad');
