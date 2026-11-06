# Complete Guide: Building Your Website with AstroWind Boilerplate

**A comprehensive guide for solo developers to transform this boilerplate into a uniquely styled, production-ready website.**

---

## Table of Contents

1. [Getting Started](#1-getting-started)
2. [Design Customization](#2-design-customization)
3. [Creating Reusable Components](#3-creating-reusable-components)
4. [Page Structure and Layouts](#4-page-structure-and-layouts)
5. [Content Management](#5-content-management)
6. [Optimization Best Practices](#6-optimization-best-practices)
7. [Deployment Workflow](#7-deployment-workflow)
8. [Solo Developer Workflow Tips](#8-solo-developer-workflow-tips)

---

## 1. Getting Started

### Initial Setup

```bash
# Clone or download this template
npm install

# Start development server
npm run dev

# Visit http://localhost:4321
```

### Understanding the Project Structure

```
src/
├── assets/              # Images, fonts, global styles
│   ├── images/         # Optimized images
│   └── styles/
│       └── tailwind.css  # Global CSS utilities & components
├── components/
│   ├── blog/           # Blog-specific components
│   ├── common/         # Shared components (Image, Metadata)
│   ├── ui/             # UI primitives (Button, Heading, ItemGrid)
│   └── widgets/        # Page section widgets (Hero, Features, etc.)
├── content/
│   └── post/           # Blog posts (.md/.mdx files)
├── layouts/            # Page templates
│   ├── Layout.astro        # Base layout with <head>, analytics
│   ├── PageLayout.astro    # Page with header/footer
│   └── LandingLayout.astro # Landing page layout
├── pages/              # File-based routing
│   ├── index.astro     # Homepage
│   └── [...blog]/      # Dynamic blog routes
├── utils/              # Helper functions
├── config.yaml         # Main site configuration
├── constants.ts        # TypeScript constants
├── navigation.ts       # Navigation menu structure
└── types.d.ts          # Global type definitions
```

**Key Principle:** This structure separates concerns beautifully. Pages use layouts, layouts use widgets, widgets use UI components.

---

## 2. Design Customization

### A. Create Your Visual Identity

#### Step 1: Choose Your Brand Colors

Edit `src/components/CustomStyles.astro`:

```astro
---
import '@fontsource-variable/inter'; // Change this to your font
---

<style is:inline>
  :root {
    /* 🎨 YOUR BRAND COLORS */
    --aw-color-primary: rgb(59 130 246); /* Main brand color */
    --aw-color-secondary: rgb(99 102 241); /* Secondary accent */
    --aw-color-accent: rgb(236 72 153); /* CTA, highlights */

    /* 📝 TEXT COLORS (Light Mode) */
    --aw-color-text-heading: rgb(0 0 0);
    --aw-color-text-default: rgb(31 41 55);
    --aw-color-text-muted: rgb(107 114 128);
    --aw-color-bg-page: rgb(255 255 255);

    /* 🌙 DARK MODE BACKGROUND */
    --aw-color-bg-page-dark: rgb(15 23 42);

    /* 🎯 TEXT SELECTION */
    ::selection {
      background-color: rgb(59 130 246 / 30%);
    }
  }

  .dark {
    /* Same structure for dark mode */
    --aw-color-primary: rgb(96 165 250);
    --aw-color-secondary: rgb(129 140 248);
    --aw-color-accent: rgb(244 114 182);

    --aw-color-text-heading: rgb(248 250 252);
    --aw-color-text-default: rgb(226 232 240);
    --aw-color-text-muted: rgb(148 163 184);
    --aw-color-bg-page: rgb(15 23 42);

    ::selection {
      background-color: rgb(96 165 250 / 30%);
      color: white;
    }
  }
</style>
```

**Pro Tip:** Use tools like [Coolors.co](https://coolors.co/) or [Realtime Colors](https://realtimecolors.com/) to generate accessible color palettes.

#### Step 2: Change Typography

**Option A: Use a Google Font (via Fontsource)**

```bash
# Install your chosen font
npm install @fontsource-variable/space-grotesk
```

Then update `CustomStyles.astro`:

```astro
---
import '@fontsource-variable/space-grotesk';
---

<style is:inline>
  :root {
    --aw-font-sans: 'Space Grotesk Variable';
    --aw-font-serif: 'Space Grotesk Variable';
    --aw-font-heading: 'Space Grotesk Variable';
  }
</style>
```

**Option B: Mix Font Families**

```bash
npm install @fontsource-variable/inter @fontsource-variable/playfair-display
```

```astro
---
import '@fontsource-variable/inter';
import '@fontsource-variable/playfair-display';
---

<style is:inline>
  :root {
    --aw-font-sans: 'Inter Variable'; /* Body text */
    --aw-font-serif: 'Playfair Display Variable'; /* Quotes, accents */
    --aw-font-heading: 'Playfair Display Variable'; /* Headings */
  }
</style>
```

**Available fonts** (see comments in `CustomStyles.astro`):

- Modern/Tech: Inter, Space Grotesk, IBM Plex Sans
- Friendly: Nunito, Poppins, Outfit
- Professional: DM Sans, Roboto, Fira Sans
- Elegant: Literata, Playfair Display

#### Step 3: Customize Tailwind Components

Edit `src/assets/styles/tailwind.css` to create your button styles:

```css
@layer components {
  /* 🔘 Base button */
  .btn {
    @apply inline-flex items-center justify-center 
           rounded-full font-medium text-center text-base
           transition-all duration-200 ease-in-out
           py-3 px-8 
           focus:ring-2 focus:ring-offset-2
           cursor-pointer;
  }

  /* 🎯 Primary CTA button */
  .btn-primary {
    @apply btn font-semibold 
           bg-primary text-white border-2 border-primary
           hover:bg-primary/90 hover:shadow-lg hover:scale-105
           dark:bg-primary dark:hover:bg-primary/90;
  }

  /* 👻 Ghost button (outline) */
  .btn-secondary {
    @apply btn border-2 border-gray-300 bg-transparent
           text-gray-700 hover:bg-gray-50 hover:border-gray-400
           dark:text-gray-300 dark:border-gray-600 
           dark:hover:bg-slate-800;
  }

  /* 🔗 Text link button */
  .btn-tertiary {
    @apply btn border-none shadow-none 
           text-primary hover:text-primary/80
           dark:text-primary dark:hover:text-primary/80;
  }

  /* 🎨 NEW: Gradient button (your custom style) */
  .btn-gradient {
    @apply btn font-bold text-white
           bg-gradient-to-r from-primary via-secondary to-accent
           hover:shadow-2xl hover:scale-105
           border-none;
  }
}
```

**Usage in components:**

```astro
<a href="#" class="btn-primary">Get Started</a>
<a href="#" class="btn-secondary">Learn More</a>
<a href="#" class="btn-gradient">Limited Offer!</a>
```

### B. Design System Strategy

#### Create a Design Tokens File

Create `src/design-tokens.ts`:

```typescript
export const DESIGN_TOKENS = {
  colors: {
    brand: {
      primary: 'var(--aw-color-primary)',
      secondary: 'var(--aw-color-secondary)',
      accent: 'var(--aw-color-accent)',
    },
    neutral: {
      white: '#ffffff',
      gray: {
        50: '#f9fafb',
        100: '#f3f4f6',
        // ... etc
      },
      black: '#000000',
    },
  },
  spacing: {
    section: 'py-16 md:py-20 lg:py-24',
    container: 'mx-auto max-w-7xl px-4 sm:px-6',
  },
  typography: {
    heading: {
      h1: 'text-4xl md:text-5xl lg:text-6xl font-bold tracking-tight',
      h2: 'text-3xl md:text-4xl lg:text-5xl font-bold tracking-tight',
      h3: 'text-2xl md:text-3xl font-bold',
    },
  },
  effects: {
    card: 'rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300',
    gradient: 'bg-gradient-to-br from-primary to-secondary',
  },
} as const;
```

**Use in components:**

```astro
---
import { DESIGN_TOKENS } from '@/design-tokens';
---

<section class={DESIGN_TOKENS.spacing.section}>
  <div class={DESIGN_TOKENS.spacing.container}>
    <h2 class={DESIGN_TOKENS.typography.heading.h2}>Your Heading</h2>
  </div>
</section>
```

---

## 3. Creating Reusable Components

### Component Architecture Philosophy

**Three Layers:**

1. **UI Components** (`src/components/ui/`) - Atomic elements
2. **Widgets** (`src/components/widgets/`) - Composed sections
3. **Pages** (`src/pages/`) - Full page compositions

### Example: Build a Custom Card Component

#### Step 1: Create UI Component

`src/components/ui/Card.astro`:

```astro
---
export interface Props {
  variant?: 'default' | 'bordered' | 'elevated' | 'gradient';
  padding?: 'sm' | 'md' | 'lg';
  rounded?: 'sm' | 'md' | 'lg' | 'xl';
  class?: string;
}

const { variant = 'default', padding = 'md', rounded = 'lg', class: className = '' } = Astro.props;

const variantClasses = {
  default: 'bg-white dark:bg-slate-800 shadow-md',
  bordered: 'bg-white dark:bg-slate-800 border-2 border-gray-200 dark:border-gray-700',
  elevated: 'bg-white dark:bg-slate-800 shadow-xl hover:shadow-2xl transition-shadow',
  gradient: 'bg-gradient-to-br from-primary/10 to-accent/10 dark:from-primary/20 dark:to-accent/20',
};

const paddingClasses = {
  sm: 'p-4',
  md: 'p-6',
  lg: 'p-8',
};

const roundedClasses = {
  sm: 'rounded',
  md: 'rounded-lg',
  lg: 'rounded-xl',
  xl: 'rounded-2xl',
};
---

<div class:list={[variantClasses[variant], paddingClasses[padding], roundedClasses[rounded], className]}>
  <slot />
</div>
```

**Usage:**

```astro
---
import Card from '@/components/ui/Card.astro';
---

<Card variant="elevated" padding="lg" rounded="xl">
  <h3>Card Title</h3>
  <p>Card content goes here...</p>
</Card>
```

### Example: Build a Custom Feature Widget

`src/components/widgets/FeatureGrid.astro`:

```astro
---
import Card from '@/components/ui/Card.astro';
import Headline from '@/components/ui/Headline.astro';
import Icon from 'astro-icon';

export interface Feature {
  title: string;
  description: string;
  icon?: string;
  link?: string;
}

export interface Props {
  title?: string;
  subtitle?: string;
  features: Feature[];
  columns?: 2 | 3 | 4;
}

const { title, subtitle, features, columns = 3 } = Astro.props;

const gridCols = {
  2: 'md:grid-cols-2',
  3: 'md:grid-cols-2 lg:grid-cols-3',
  4: 'md:grid-cols-2 lg:grid-cols-4',
};
---

<section class="py-16 md:py-20">
  <div class="mx-auto max-w-7xl px-4 sm:px-6">
    {(title || subtitle) && <Headline title={title} subtitle={subtitle} class="mb-12" />}

    <div class:list={['grid grid-cols-1 gap-6', gridCols[columns]]}>
      {
        features.map((feature) => (
          <Card variant="elevated" padding="lg">
            {feature.icon && <Icon name={feature.icon} class="w-12 h-12 text-primary mb-4" />}
            <h3 class="text-xl font-bold mb-2">{feature.title}</h3>
            <p class="text-muted">{feature.description}</p>
            {feature.link && (
              <a href={feature.link} class="btn-tertiary mt-4">
                Learn more →
              </a>
            )}
          </Card>
        ))
      }
    </div>
  </div>
</section>
```

**Usage in a page:**

```astro
---
import FeatureGrid from '@/components/widgets/FeatureGrid.astro';
---

<FeatureGrid
  title="Why Choose Us"
  subtitle="Features that make us stand out"
  columns={3}
  features={[
    {
      title: 'Lightning Fast',
      description: 'Built for speed with modern web technologies',
      icon: 'tabler:bolt',
    },
    {
      title: 'Fully Responsive',
      description: 'Looks perfect on all devices and screen sizes',
      icon: 'tabler:device-mobile',
    },
    {
      title: 'SEO Optimized',
      description: 'Rank higher with built-in SEO best practices',
      icon: 'tabler:seo',
    },
  ]}
/>
```

### Best Practices for Components

1. **Always define TypeScript interfaces** for props
2. **Provide sensible defaults** using destructuring
3. **Use class:list** for conditional classes
4. **Make components composable** with slots
5. **Follow naming conventions**: PascalCase for files
6. **Add JSDoc comments** for complex components

```astro
---
/**
 * A reusable testimonial component with avatar, quote, and attribution.
 *
 * @example
 * <Testimonial
 *   quote="This product changed my life!"
 *   author="Jane Doe"
 *   role="CEO, Company"
 *   avatar="/images/jane.jpg"
 * />
 */
export interface Props {
  quote: string;
  author: string;
  role?: string;
  avatar?: string;
}
---
```

---

## 4. Page Structure and Layouts

### A. Understanding Layouts

**Three main layouts:**

1. **`Layout.astro`** - Base HTML structure, no header/footer
2. **`PageLayout.astro`** - Standard pages with header/footer
3. **`LandingLayout.astro`** - Landing pages (different header style)

### B. Creating a New Page Type

Let's create a "Portfolio" page layout:

`src/layouts/PortfolioLayout.astro`:

```astro
---
import Layout from '@/layouts/Layout.astro';
import Header from '@/components/widgets/Header.astro';
import Footer from '@/components/widgets/Footer.astro';

import type { MetaData } from '@/types';

export interface Props {
  metadata?: MetaData;
}

const { metadata } = Astro.props;
---

<Layout metadata={metadata}>
  <slot name="announcement" />

  <!-- Custom header for portfolio -->
  <Header
    position="left"
    links={[
      { text: 'Portfolio', href: '/portfolio' },
      { text: 'About', href: '/about' },
      { text: 'Contact', href: '/contact' },
    ]}
  />

  <!-- Main content area with custom styling -->
  <main class="bg-gradient-to-b from-white to-gray-50 dark:from-slate-900 dark:to-slate-800">
    <slot />
  </main>

  <!-- Custom footer -->
  <Footer
    links={[
      { title: 'Portfolio', href: '/portfolio' },
      { title: 'Services', href: '/services' },
    ]}
    socialLinks={[
      { ariaLabel: 'GitHub', icon: 'tabler:brand-github', href: '#' },
      { ariaLabel: 'LinkedIn', icon: 'tabler:brand-linkedin', href: '#' },
    ]}
  />
</Layout>
```

**Use it in a page:**

`src/pages/portfolio.astro`:

```astro
---
import PortfolioLayout from '@/layouts/PortfolioLayout.astro';
import FeatureGrid from '@/components/widgets/FeatureGrid.astro';

const metadata = {
  title: 'My Portfolio',
  description: 'Showcasing my best work',
};
---

<PortfolioLayout metadata={metadata}>
  <!-- Your portfolio content -->
  <section class="py-20">
    <div class="container mx-auto">
      <h1>My Portfolio</h1>
      <!-- ... rest of your content -->
    </div>
  </section>
</PortfolioLayout>
```

### C. Page Composition Strategy

**Recommended structure for any page:**

```astro
---
import Layout from '@/layouts/PageLayout.astro';
import Hero from '@/components/widgets/Hero.astro';
import Features from '@/components/widgets/Features.astro';
import CTA from '@/components/widgets/CallToAction.astro';
---

<Layout metadata={{ title: 'Page Title' }}>
  <!-- 1. Above-the-fold hero -->
  <Hero />

  <!-- 2. Main content sections -->
  <Features />

  <!-- 3. Social proof or testimonials -->
  <Testimonials />

  <!-- 4. Final CTA -->
  <CTA />
</Layout>
```

---

## 5. Content Management

### A. Site Configuration

Edit `src/config.yaml`:

```yaml
site:
  name: 'Your Brand Name'
  site: 'https://yourdomain.com'
  base: '/'
  trailingSlash: false

metadata:
  title:
    default: 'Your Brand Name'
    template: '%s — Your Brand Name' # %s = page title
  description: 'Your compelling site description for SEO'
  robots:
    index: true # Allow search engines
    follow: true
  openGraph:
    site_name: 'Your Brand Name'
    images:
      - url: '@/assets/images/og-image.png' # 1200x628px
        width: 1200
        height: 628
    type: website
  twitter:
    handle: '@yourusername'
    site: '@yourusername'
    cardType: summary_large_image

i18n:
  language: en
  textDirection: ltr # or 'rtl' for Arabic, Hebrew, etc.

apps:
  blog:
    isEnabled: true # Set to false to disable blog entirely
    postsPerPage: 9

analytics:
  vendors:
    googleAnalytics:
      id: null # or "G-XXXXXXXXXX"

ui:
  theme: 'system' # 'system' | 'light' | 'dark' | 'light:only' | 'dark:only'
```

### B. Navigation Structure

Edit `src/navigation.ts`:

```typescript
import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    {
      text: 'Home',
      href: getPermalink('/'),
    },
    {
      text: 'Services',
      links: [
        { text: 'Consulting', href: getPermalink('/services/consulting') },
        { text: 'Development', href: getPermalink('/services/development') },
        { text: 'Design', href: getPermalink('/services/design') },
      ],
    },
    {
      text: 'About',
      href: getPermalink('/about'),
    },
    {
      text: 'Blog',
      href: getPermalink('/blog'),
    },
    {
      text: 'Contact',
      href: getPermalink('/contact'),
    },
  ],
  actions: [
    {
      text: 'Get Started',
      href: getPermalink('/contact'),
      variant: 'primary',
    },
  ],
};

export const footerData = {
  links: [
    {
      title: 'Product',
      links: [
        { text: 'Features', href: '#' },
        { text: 'Pricing', href: '#' },
        { text: 'Security', href: '#' },
      ],
    },
    {
      title: 'Company',
      links: [
        { text: 'About', href: '#' },
        { text: 'Blog', href: '#' },
        { text: 'Careers', href: '#' },
      ],
    },
  ],
  secondaryLinks: [
    { text: 'Terms', href: getPermalink('/terms') },
    { text: 'Privacy', href: getPermalink('/privacy') },
  ],
  socialLinks: [
    { ariaLabel: 'X', icon: 'tabler:brand-x', href: '#' },
    { ariaLabel: 'LinkedIn', icon: 'tabler:brand-linkedin', href: '#' },
    { ariaLabel: 'GitHub', icon: 'tabler:brand-github', href: '#' },
  ],
};
```

### C. Blog Content

Create blog posts in `src/data/post/`:

`src/data/post/my-first-post.md`:

````markdown
---
publishDate: 2026-01-21T00:00:00Z
title: 'My First Blog Post'
excerpt: 'A compelling excerpt that appears in blog listings'
image: '@/assets/images/blog/post-1.jpg'
category: 'Tutorials'
tags:
  - astro
  - web-development
  - tutorial
author: 'Your Name'
metadata:
  canonical: https://yourdomain.com/my-first-post
---

# Your Blog Post Title

Your markdown content here. You can use:

- Lists
- **Bold text**
- _Italic text_
- [Links](https://example.com)
- Images: ![Alt text](@/assets/images/example.jpg)
- Code blocks

```javascript
const greeting = 'Hello, World!';
console.log(greeting);
```
````

## Section Heading

More content...

````

**Using MDX for interactive content:**

`src/data/post/interactive-post.mdx`:

```mdx
---
title: 'Interactive Blog Post'
---

import Button from '@/components/ui/Button.astro';
import Card from '@/components/ui/Card.astro';

# Interactive Content with Components

You can embed Astro components directly in MDX:

<Card variant="gradient" padding="lg">
  <h3>Special Announcement</h3>
  <p>This is a custom card component in your blog post!</p>
  <Button href="/contact">Contact Us</Button>
</Card>

Regular markdown continues below...
````

---

## 6. Optimization Best Practices

### A. Image Optimization

**Always use the `<Image>` component:**

```astro
---
import { Image } from 'astro:assets';
import heroImage from '@/assets/images/hero.jpg';
---

<!-- ✅ GOOD: Automatic optimization -->
<Image src={heroImage} alt="Descriptive alt text" width={1200} height={600} loading="eager" <!-- Above the fold -->
  quality={80}
  />

  <!-- ✅ GOOD: External images -->
  <Image
    src="https://images.unsplash.com/photo-xxx"
    alt="Descriptive alt text"
    width={800}
    height={600}
    loading="lazy"
    <!--
    Below
    the
    fold
    --
  >
    />

    <!-- ❌ BAD: Plain img tag (no optimization) -->
    <img src="/images/hero.jpg" alt="Hero" /></Image
  ></Image
>
```

**Image sizing guidelines:**

- Hero images: 1920x1080px (16:9)
- Card images: 800x600px (4:3)
- Thumbnails: 400x300px
- Open Graph: 1200x628px
- Favicon: 512x512px

### B. Performance Checklist

**Before deploying, ensure:**

```bash
# 1. Run all checks
npm run check

# 2. Fix any issues
npm run fix

# 3. Build and verify
npm run build

# 4. Check bundle size
ls -lh dist/_astro/*.js
```

**Performance optimization checklist:**

- [ ] Use `<Image>` component for all images
- [ ] Set `loading="eager"` for above-the-fold images
- [ ] Set `loading="lazy"` for below-the-fold images
- [ ] Compress images before adding to project (use TinyPNG)
- [ ] Use WebP/AVIF formats when possible
- [ ] Minimize custom JavaScript
- [ ] Use Tailwind utilities instead of custom CSS
- [ ] Enable prefetching for key pages
- [ ] Test on mobile devices (Chrome DevTools)
- [ ] Run Lighthouse audit (target: 95+ scores)

### C. SEO Optimization

**Per-page metadata:**

```astro
---
import Layout from '@/layouts/PageLayout.astro';

const metadata = {
  title: 'Specific Page Title',
  description: 'Unique, compelling description (150-160 characters)',
  canonical: 'https://yourdomain.com/this-page',
  robots: {
    index: true,
    follow: true,
  },
  openGraph: {
    type: 'article',
    images: [
      {
        url: '@/assets/images/page-specific-og.jpg',
        width: 1200,
        height: 628,
      },
    ],
  },
};
---

<Layout metadata={metadata}>
  <!-- Page content -->
</Layout>
```

**SEO best practices:**

1. **Unique titles**: Every page should have a unique, descriptive title
2. **Meta descriptions**: Write compelling descriptions (150-160 chars)
3. **Heading hierarchy**: Use H1 → H2 → H3 in order
4. **Alt text**: Describe images for accessibility and SEO
5. **Internal linking**: Link related pages together
6. **Sitemap**: Automatically generated at `/sitemap-index.xml`
7. **Robots.txt**: Already configured in `/public/robots.txt`

---

## 7. Deployment Workflow

### A. Pre-Deployment Checklist

```bash
# 1. Update site configuration
# Edit src/config.yaml with production URLs

# 2. Run all checks
npm run check

# 3. Fix any issues
npm run fix

# 4. Test production build locally
npm run build
npm run preview

# 5. Verify in browser
# Visit http://localhost:4321
# Test all pages, forms, links

# 6. Run Lighthouse audit
# Chrome DevTools → Lighthouse → Generate report
# Target: 95+ in all categories
```

### B. Cloudflare Pages Deployment (Recommended)

**Why Cloudflare Pages:**

- ✅ Free tier is generous
- ✅ Global CDN (fast worldwide)
- ✅ Automatic HTTPS
- ✅ Unlimited bandwidth
- ✅ Built-in DDoS protection
- ✅ Easy custom domains

**Setup Steps:**

1. **Push to GitHub:**

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/your-repo.git
   git push -u origin main
   ```

2. **Connect to Cloudflare Pages:**
   - Visit [Cloudflare Dashboard](https://dash.cloudflare.com)
   - Pages → Create a project → Connect to Git
   - Select your repository
   - Build settings:
     - **Build command:** `npm run build`
     - **Build output directory:** `dist`
     - **Root directory:** `/`

3. **Environment Variables (if needed):**
   - Settings → Environment variables
   - Add: `PUBLIC_SITE_URL` = `https://yourdomain.com`
   - Add: `PUBLIC_GA_ID` = `G-XXXXXXXXXX` (optional)

4. **Custom Domain:**
   - Pages → Your project → Custom domains
   - Add your domain
   - Update DNS records as instructed
   - SSL certificate auto-provisions (2-5 minutes)

5. **Automatic Deployments:**
   - Every push to `main` = production deploy
   - Every pull request = preview deploy
   - Rollback to any previous deploy with one click

**Alternative deployment command:**

```bash
# Direct deploy via Wrangler CLI
npm install -g wrangler
wrangler login
npm run deploy
```

### C. Alternative Hosting Options

**Vercel:**

```bash
npm install -g vercel
vercel --prod
# Follow prompts
```

**Netlify:**

```bash
npm install -g netlify-cli
netlify deploy --prod
# Follow prompts
```

**GitHub Pages:**

```bash
# Add to package.json scripts:
# "deploy": "npm run build && npx gh-pages -d dist"
npm run deploy
```

### D. Post-Deployment Verification

**Checklist:**

- [ ] Visit your live URL
- [ ] Test all navigation links
- [ ] Verify images load correctly
- [ ] Check mobile responsiveness
- [ ] Test contact forms (if any)
- [ ] Verify analytics are tracking
- [ ] Check Open Graph tags (share on social media)
- [ ] Run Lighthouse on production URL
- [ ] Test page speed on [PageSpeed Insights](https://pagespeed.web.dev/)
- [ ] Submit sitemap to Google Search Console

---

## 8. Solo Developer Workflow Tips

### A. Development Workflow

**Daily routine:**

```bash
# Morning: Start fresh
git pull origin main
npm install  # If package.json changed
npm run dev

# During development:
# - Make small, incremental changes
# - Test in browser after each change
# - Use browser DevTools for debugging

# Before committing:
npm run check  # Must pass!
npm run fix    # Auto-fix issues

# Commit often:
git add .
git commit -m "feat: add new hero component"
git push origin main
```

**Git commit message convention:**

- `feat:` - New feature
- `fix:` - Bug fix
- `style:` - Design/CSS changes
- `refactor:` - Code refactoring
- `docs:` - Documentation
- `chore:` - Maintenance tasks

### B. Project Management

**Use TODO comments in code:**

```astro
---
// TODO: Add error handling for form submission
// FIXME: Image optimization not working for external URLs
// NOTE: This component will be refactored in v2.0
---
```

**Create a simple roadmap in `ROADMAP.md`:**

```markdown
# Project Roadmap

## Phase 1: MVP (Week 1-2)

- [x] Design system setup
- [x] Homepage
- [ ] About page
- [ ] Contact form

## Phase 2: Content (Week 3-4)

- [ ] Blog setup
- [ ] 5 initial blog posts
- [ ] Portfolio gallery

## Phase 3: Polish (Week 5)

- [ ] SEO optimization
- [ ] Performance tuning
- [ ] Analytics setup
- [ ] Launch!
```

### C. Time-Saving Tips

**1. Use existing widgets creatively:**

```astro
<!-- Repurpose Features widget as a "Services" section -->
<Features
  title="Our Services"
  items={[
    { title: 'Service 1', description: '...', icon: 'tabler:code' },
    { title: 'Service 2', description: '...', icon: 'tabler:palette' },
  ]}
/>

<!-- Repurpose Content widget as "About" section -->
<Content title="About Us" image={{ src: '@/assets/images/team.jpg' }}>
  <Fragment slot="content"> Our story goes here... </Fragment>
</Content>
```

**2. Create component snippets in your editor:**

VS Code: `.vscode/astro-component.code-snippets`:

```json
{
  "Astro Component": {
    "prefix": "acomp",
    "body": [
      "---",
      "export interface Props {",
      "  $1",
      "}",
      "",
      "const { $2 } = Astro.props;",
      "---",
      "",
      "<div>",
      "  <slot />",
      "</div>"
    ]
  }
}
```

**3. Bookmark these resources:**

- [Astro Docs](https://docs.astro.build)
- [Tailwind Docs](https://tailwindcss.com/docs)
- [Tabler Icons](https://tabler.io/icons) (free icon set)
- [Unsplash](https://unsplash.com) (free stock photos)
- [Coolors](https://coolors.co) (color palette generator)

### D. Debugging Tips

**Common issues and solutions:**

**1. Component not rendering:**

```bash
# Check for TypeScript errors
npm run check:astro

# Look for missing imports
```

**2. Styles not applying:**

```astro
<!-- Use class:list for conditional classes -->
<div class:list={['base-class', isActive && 'active-class']}>
  <!-- Check Tailwind purge config in tailwind.config.js -->
</div>
```

**3. Images not loading:**

```astro
<!-- ✅ Correct: Use @ for src/ imports -->import image from '@/assets/images/photo.jpg';

<!-- ❌ Wrong: Relative path -->
import image from '../assets/images/photo.jpg';
```

**4. Build fails:**

```bash
# Clear cache and rebuild
rm -rf node_modules dist .astro
npm install
npm run build
```

### E. Maintenance Schedule

**Weekly:**

- [ ] Check for broken links
- [ ] Review analytics
- [ ] Backup content

**Monthly:**

- [ ] Update dependencies: `npm update`
- [ ] Run security audit: `npm audit`
- [ ] Review and respond to form submissions
- [ ] Check page speed scores

**Quarterly:**

- [ ] Review and update content
- [ ] Refresh images/screenshots
- [ ] Update copyright year
- [ ] Review and improve SEO

---

## Quick Start Checklist

Ready to start building? Follow this checklist:

### Phase 1: Setup (Day 1)

- [ ] Clone this template
- [ ] Run `npm install`
- [ ] Start dev server: `npm run dev`
- [ ] Explore the demo site at `localhost:4321`

### Phase 2: Branding (Day 1-2)

- [ ] Choose brand colors
- [ ] Select fonts
- [ ] Update `src/components/CustomStyles.astro`
- [ ] Update `src/config.yaml` (site name, URL, metadata)
- [ ] Replace logo in `src/components/Logo.astro`
- [ ] Create favicon set (use [Favicon Generator](https://realfavicongenerator.net/))

### Phase 3: Content (Day 3-7)

- [ ] Plan your site structure (pages)
- [ ] Update navigation in `src/navigation.ts`
- [ ] Create homepage (`src/pages/index.astro`)
- [ ] Create other key pages (About, Services, Contact)
- [ ] Add images to `src/assets/images/`
- [ ] Write initial blog posts (optional)

### Phase 4: Customization (Day 8-10)

- [ ] Customize or create new components
- [ ] Adjust layouts as needed
- [ ] Set up contact form (use [Formspree](https://formspree.io/) or similar)
- [ ] Add analytics (Google Analytics or Plausible)

### Phase 5: Optimization (Day 11-12)

- [ ] Run `npm run check` and fix issues
- [ ] Optimize images (compress, use WebP)
- [ ] Test on mobile devices
- [ ] Run Lighthouse audit (target 95+)
- [ ] Check all links work

### Phase 6: Deploy (Day 13-14)

- [ ] Push to GitHub
- [ ] Set up Cloudflare Pages
- [ ] Configure custom domain
- [ ] Submit sitemap to Google Search Console
- [ ] Set up uptime monitoring (e.g., UptimeRobot)
- [ ] Announce your launch!

---

## Conclusion

You now have a comprehensive guide to:

✅ Customize the design system (colors, fonts, components)  
✅ Create reusable, type-safe components  
✅ Structure pages and layouts effectively  
✅ Manage content with YAML and Markdown  
✅ Optimize for performance and SEO  
✅ Deploy to production with confidence  
✅ Maintain your site as a solo developer

**Remember:**

- Start small, iterate often
- Use the provided widgets as templates
- Keep your design consistent
- Test on real devices
- Monitor performance metrics
- Have fun building!

---

## Additional Resources

**Documentation:**

- [Full AGENTS.md](./AGENTS.md) - AI agent guidelines
- [DEPLOYMENT.md](./docs/DEPLOYMENT.md) - Detailed deployment guide
- [OPTIMIZATIONS.md](./docs/OPTIMIZATIONS.md) - Performance optimizations

**Community:**

- [Astro Discord](https://astro.build/chat)
- [Astro GitHub Discussions](https://github.com/withastro/astro/discussions)
- [AstroWind GitHub](https://github.com/arthelokyo/astrowind)

**Tools:**

- [Astro VSCode Extension](https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode)
- [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
- [Prettier Astro Plugin](https://github.com/withastro/prettier-plugin-astro)

---

**Last Updated:** January 21, 2026  
**Template Version:** AstroWind 5.12.9  
**Author:** Your Name

Happy building! 🚀
