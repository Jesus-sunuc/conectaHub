CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    fb_uid VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    avatar_url TEXT,
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE business_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    icon_url TEXT,
    parent_id INTEGER REFERENCES business_categories(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE business_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES business_categories(id),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    short_description VARCHAR(500),
    logo_url TEXT,
    phone_number VARCHAR(20),
    email VARCHAR(255),
    website_url TEXT,
    address VARCHAR(255),
    business_hours JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE business_social_links (
    id SERIAL PRIMARY KEY,
    business_id INTEGER NOT NULL REFERENCES business_profiles(id) ON DELETE CASCADE,
    platform VARCHAR(50) NOT NULL, -- facebook, instagram, twitter, whatsapp, etc.
    url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(business_id, platform)
);

CREATE TABLE announcements (
    id SERIAL PRIMARY KEY,
    business_id INTEGER NOT NULL REFERENCES business_profiles(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    expires_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE announcement_replies (
    id SERIAL PRIMARY KEY,
    announcement_id INTEGER NOT NULL REFERENCES announcements(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    commenter_name VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE announcement_reactions (
    id SERIAL PRIMARY KEY,
    announcement_id INTEGER REFERENCES announcements(id) ON DELETE CASCADE,
    reply_id INTEGER REFERENCES announcement_replies(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    reaction_type VARCHAR(20) NOT NULL DEFAULT 'like', -- like, love, wow, sad, angry
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Ensure reaction is either for announcement OR reply, not both
    CONSTRAINT check_reaction_target CHECK (
        (announcement_id IS NOT NULL AND reply_id IS NULL) OR 
        (announcement_id IS NULL AND reply_id IS NOT NULL)
    ),
    -- Prevent duplicate reactions from same user
    UNIQUE(announcement_id, user_id),
    UNIQUE(reply_id, user_id)
);

-- Indexes for better performance
CREATE INDEX idx_business_profiles_category ON business_profiles(category_id);
CREATE INDEX idx_business_profiles_slug ON business_profiles(slug);
CREATE INDEX idx_business_social_links_business ON business_social_links(business_id);
CREATE INDEX idx_announcements_business ON announcements(business_id);
CREATE INDEX idx_announcement_replies_announcement ON announcement_replies(announcement_id);
CREATE INDEX idx_announcement_reactions_announcement ON announcement_reactions(announcement_id);
CREATE INDEX idx_announcement_reactions_reply ON announcement_reactions(reply_id);



