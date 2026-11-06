# Quick Reference Card

**A cheat sheet for common tasks when building with this boilerplate.**

---

## Common Commands

```bash
# Development
npm run dev              # Start dev server (localhost:4321)
npm run build            # Build for production
npm run preview          # Preview production build

# Quality Checks
npm run check            # Run ALL checks (required before commit)
npm run fix              # Auto-fix ESLint and Prettier issues
npm run check:astro      # Type checking only
npm run check:eslint     # Lint only
npm run check:prettier   # Format check only

# Deployment
npm run deploy           # Build and deploy to Cloudflare Pages
```

---

## File Structure at a Glance

```
src/
├── assets/
│   ├── images/              # Put your images here
│   └── styles/
│       └── tailwind.css     # Global CSS & button styles
├── components/
│   ├── ui/                  # Buttons, Cards, basic elements
│   ├── widgets/             # Hero, Features, CTA sections
│   ├── common/              # Shared (Image, Metadata)
│   ├── CustomStyles.astro   # 🎨 Colors & Fonts
│   └── Logo.astro           # Your logo
├── layouts/                 # Page templates
├── pages/                   # Routes (index.astro = homepage)
├── config.yaml              # ⚙️ Site settings
└── navigation.ts            # 🧭 Menu structure
```

---

## Customization Cheat Sheet

### Change Colors

Edit `src/components/CustomStyles.astro`:

```css
:root {
  --aw-color-primary: rgb(59 130 246); /* Main brand */
  --aw-color-secondary: rgb(99 102 241); /* Secondary */
  --aw-color-accent: rgb(236 72 153); /* Accents */
}
```

### Change Fonts

```bash
npm install @fontsource-variable/your-font
```

```astro
---
import '@fontsource-variable/your-font';
---

<style is:inline>
  :root {
    --aw-font-sans: 'Your Font Variable';
  }
</style>
```

### Change Site Name & URL

Edit `src/config.yaml`:

```yaml
site:
  name: 'Your Site Name'
  site: 'https://yourdomain.com'

metadata:
  title:
    default: 'Your Site Name'
```

### Update Navigation

Edit `src/navigation.ts`:

```typescript
export const headerData = {
  links: [
    { text: 'Home', href: '/' },
    { text: 'About', href: '/about' },
  ],
  actions: [{ text: 'Get Started', href: '/contact', variant: 'primary' }],
};
```

---

## Component Examples

### Create a New Page

`src/pages/about.astro`:

```astro
---
import Layout from '@/layouts/PageLayout.astro';
import Hero from '@/components/widgets/Hero.astro';

const metadata = {
  title: 'About Us',
  description: 'Learn more about our company',
};
---

<Layout metadata={metadata}>
  <Hero title="About Us" subtitle="Our story and mission" />

  <section class="py-16">
    <div class="container mx-auto px-4">
      <h2>Our Story</h2>
      <p>Content goes here...</p>
    </div>
  </section>
</Layout>
```

### Use Existing Widgets

```astro
---
import Hero from '@/components/widgets/Hero.astro';
import Features from '@/components/widgets/Features.astro';
import CallToAction from '@/components/widgets/CallToAction.astro';
---

<!-- Hero Section -->
<Hero
  title="Welcome to Our Site"
  subtitle="We do amazing things"
  actions={[
    { text: 'Get Started', href: '/contact', variant: 'primary' },
    { text: 'Learn More', href: '#features' },
  ]}
  image={{ src: '@/assets/images/hero.jpg', alt: 'Hero' }}
/>

<!-- Features Section -->
<Features
  title="Why Choose Us"
  items={[
    {
      title: 'Fast',
      description: 'Lightning quick performance',
      icon: 'tabler:bolt',
    },
    {
      title: 'Secure',
      description: 'Bank-level security',
      icon: 'tabler:shield-check',
    },
  ]}
/>

<!-- Call to Action -->
<CallToAction title="Ready to get started?" actions={[{ text: 'Sign Up Now', href: '/signup', variant: 'primary' }]} />
```

### Create a Simple Component

`src/components/ui/Badge.astro`:

```astro
---
export interface Props {
  color?: 'blue' | 'green' | 'red' | 'yellow';
  text: string;
}

const { color = 'blue', text } = Astro.props;

const colors = {
  blue: 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300',
  green: 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300',
  red: 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300',
  yellow: 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300',
};
---

<span class:list={['px-3 py-1 rounded-full text-sm font-medium', colors[color]]}>
  {text}
</span>
```

**Usage:**

```astro
---
import Badge from '@/components/ui/Badge.astro';
---

<Badge color="green" text="New" />
<Badge color="blue" text="Featured" />
```

---

## Styling Cheat Sheet

### Tailwind Utilities

```html
<!-- Spacing -->
<div class="p-4">Padding: 1rem</div>
<div class="m-8">Margin: 2rem</div>
<div class="px-6 py-8">Padding X: 1.5rem, Y: 2rem</div>

<!-- Responsive -->
<div class="text-sm md:text-base lg:text-lg">Responsive text size</div>

<!-- Flexbox -->
<div class="flex items-center justify-between gap-4">Flex container</div>

<!-- Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">Responsive grid</div>

<!-- Dark mode -->
<div class="bg-white dark:bg-slate-800">Dark mode background</div>

<!-- Hover & Focus -->
<button class="hover:bg-blue-600 focus:ring-2 focus:ring-blue-500">Interactive button</button>
```

### Custom Button Styles

Defined in `src/assets/styles/tailwind.css`:

```html
<a href="#" class="btn-primary">Primary Button</a>
<a href="#" class="btn-secondary">Secondary Button</a>
<a href="#" class="btn-tertiary">Text Link</a>
```

### Common Layout Patterns

```html
<!-- Container -->
<div class="mx-auto max-w-7xl px-4 sm:px-6">Content</div>

<!-- Section Spacing -->
<section class="py-16 md:py-20 lg:py-24">Section content</section>

<!-- Card -->
<div class="rounded-lg bg-white p-6 shadow-lg dark:bg-slate-800">Card content</div>

<!-- Two Column Layout -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-8">
  <div>Column 1</div>
  <div>Column 2</div>
</div>
```

---

## Image Optimization

### Local Images

```astro
---
import { Image } from 'astro:assets';
import heroImage from '@/assets/images/hero.jpg';
---

<Image src={heroImage} alt="Descriptive alt text" width={1200} height={600} loading="eager" quality={80} />
```

### External Images

```astro
---
import { Image } from 'astro:assets';
---

<Image src="https://images.unsplash.com/photo-xxx" alt="Descriptive alt text" width={800} height={600} loading="lazy" />
```

### Image Sizes Reference

- **Hero images:** 1920x1080px (16:9)
- **Feature cards:** 800x600px (4:3)
- **Thumbnails:** 400x300px
- **Open Graph:** 1200x628px
- **Favicon:** 512x512px

---

## Blog Posts

### Create a Blog Post

`src/data/post/my-post.md`:

```markdown
---
publishDate: 2026-01-21T00:00:00Z
title: 'My Blog Post Title'
excerpt: 'A short excerpt (1-2 sentences)'
image: '@/assets/images/blog/post-1.jpg'
category: 'Tutorials'
tags:
  - astro
  - web-development
author: 'Your Name'
---

# Your Post Title

Your markdown content here...

## Section Heading

More content...
```

### Blog Configuration

Edit `src/config.yaml`:

```yaml
apps:
  blog:
    isEnabled: true # Enable/disable blog
    postsPerPage: 9 # Posts per page
    list:
      pathname: 'blog' # /blog URL
```

---

## SEO Best Practices

### Page Metadata

```astro
---
const metadata = {
  title: 'Page Title (50-60 chars)',
  description: 'Compelling description (150-160 chars)',
  canonical: 'https://yourdomain.com/page-url',
  robots: {
    index: true,
    follow: true,
  },
  openGraph: {
    type: 'article',
    images: [
      {
        url: '@/assets/images/og-image.jpg',
        width: 1200,
        height: 628,
      },
    ],
  },
};
---
```

### SEO Checklist

- [ ] Unique title for every page (50-60 chars)
- [ ] Unique description for every page (150-160 chars)
- [ ] Descriptive alt text for all images
- [ ] Proper heading hierarchy (H1 → H2 → H3)
- [ ] Internal links between related pages
- [ ] Fast loading speed (target: < 3 seconds)
- [ ] Mobile-friendly (responsive design)
- [ ] HTTPS enabled (automatic with Cloudflare)

---

## Deployment Quick Guide

### Cloudflare Pages (Recommended)

1. **Push to GitHub:**

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git push -u origin main
   ```

2. **Connect to Cloudflare:**
   - Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
   - Pages → Create project → Connect Git
   - Build command: `npm run build`
   - Output directory: `dist`

3. **Auto-deploy:**
   - Every push to `main` = production
   - Every PR = preview deploy

### Pre-Deployment Checklist

```bash
# 1. Update config
# Edit src/config.yaml with production URL

# 2. Run checks
npm run check

# 3. Fix issues
npm run fix

# 4. Test locally
npm run build
npm run preview

# 5. Verify in browser
# Test all pages, links, forms

# 6. Deploy
git push origin main
```

---

## Troubleshooting

### Build Fails

```bash
rm -rf node_modules dist .astro
npm install
npm run build
```

### Type Errors

```bash
npm run check:astro
```

### Styling Issues

```bash
# Clear Tailwind cache
npm run build
```

### Images Not Loading

```astro
<!-- ✅ Use tilde (@) for src/ imports -->import image from '@/assets/images/photo.jpg';

<!-- ❌ Don't use relative paths -->
import image from '../assets/images/photo.jpg';
```

### Component Not Rendering

1. Check for import errors
2. Verify props are passed correctly
3. Look for TypeScript errors: `npm run check:astro`
4. Check browser console for errors

---

## Performance Tips

### Lighthouse Score Goals

- **Performance:** 95+
- **Accessibility:** 95+
- **Best Practices:** 95+
- **SEO:** 95+

### Quick Wins

1. **Use `<Image>` component** for all images
2. **Set loading attributes:**
   - `loading="eager"` for above-the-fold
   - `loading="lazy"` for below-the-fold
3. **Compress images** before adding (use TinyPNG)
4. **Minimize custom JavaScript**
5. **Use Tailwind utilities** instead of custom CSS
6. **Enable prefetching** (already configured)
7. **Test on mobile devices**

### Performance Audit Commands

```bash
# Build and preview
npm run build
npm run preview

# Test with Lighthouse (Chrome DevTools)
# 1. Open site in Chrome
# 2. F12 → Lighthouse tab
# 3. Generate report
```

---

## Keyboard Shortcuts (VSCode)

- `Ctrl/Cmd + P` - Quick file open
- `Ctrl/Cmd + Shift + P` - Command palette
- `Ctrl/Cmd + /` - Toggle comment
- `Alt + Up/Down` - Move line up/down
- `Ctrl/Cmd + D` - Select next occurrence
- `Ctrl/Cmd + Shift + L` - Select all occurrences

---

## Git Workflow

```bash
# Daily workflow
git pull origin main         # Get latest changes
# ... make changes ...
git add .                    # Stage changes
git commit -m "feat: add feature"  # Commit
git push origin main         # Push to remote

# Commit message prefixes:
# feat:     New feature
# fix:      Bug fix
# style:    Design/CSS changes
# refactor: Code refactoring
# docs:     Documentation
# chore:    Maintenance
```

---

## Useful Resources

### Documentation

- [Astro Docs](https://docs.astro.build)
- [Tailwind Docs](https://tailwindcss.com/docs)
- [TypeScript Handbook](https://www.typescriptlang.org/docs)

### Design Assets

- [Tabler Icons](https://tabler.io/icons) - Free icons
- [Unsplash](https://unsplash.com) - Free photos
- [Coolors](https://coolors.co) - Color palettes
- [Google Fonts](https://fonts.google.com)

### Tools

- [TinyPNG](https://tinypng.com) - Image compression
- [Favicon Generator](https://realfavicongenerator.net/)
- [PageSpeed Insights](https://pagespeed.web.dev/)
- [Open Graph Preview](https://www.opengraph.xyz/)

### Community

- [Astro Discord](https://astro.build/chat)
- [Astro GitHub](https://github.com/withastro/astro)
- [AstroWind Repo](https://github.com/arthelokyo/astrowind)

---

## Environment Variables

### Local Development

Create `.env` file:

```env
PUBLIC_SITE_URL=http://localhost:4321
PUBLIC_GA_ID=G-XXXXXXXXXX
```

### Production (Cloudflare Pages)

Add in Cloudflare Dashboard → Settings → Environment variables:

```
PUBLIC_SITE_URL=https://yourdomain.com
PUBLIC_GA_ID=G-XXXXXXXXXX
```

**Note:** Always prefix public variables with `PUBLIC_`

---

## Common Patterns

### Conditional Rendering

```astro
---
const showBanner = true;
const items = ['Item 1', 'Item 2'];
---

<!-- If statement -->{showBanner && <div>Banner content</div>}

<!-- Ternary -->
{showBanner ? <div>Show this</div> : <div>Show that</div>}

<!-- Loop -->
{items.map((item) => <div>{item}</div>)}
```

### Class Conditional

```astro
---
const isActive = true;
const variant = 'primary';
---

<!-- class:list for conditional classes -->
<div class:list={['base-class', isActive && 'active-class', { 'optional-class': variant === 'primary' }]}>Content</div>
```

### Slots

```astro
---
// Card.astro
---

<!-- Component definition -->
<div class="card">
  <slot name="header" />
  <slot />
  <!-- Default slot -->
  <slot name="footer" />
</div>

<!-- Usage -->
<Card>
  <div slot="header">Header content</div>
  <div>Default slot content</div>
  <div slot="footer">Footer content</div>
</Card>
```

---

## Testing Checklist

### Before Deploying

- [ ] All pages load without errors
- [ ] Navigation works on all pages
- [ ] Images load correctly
- [ ] Forms submit successfully (if any)
- [ ] Mobile responsive (test on real device)
- [ ] Dark mode works (if enabled)
- [ ] All links work (no 404s)
- [ ] Contact information is correct
- [ ] Social media links work
- [ ] Analytics tracking (check in browser console)

### After Deploying

- [ ] Production URL loads
- [ ] SSL certificate active (https://)
- [ ] All pages accessible
- [ ] Lighthouse score 95+ (all categories)
- [ ] PageSpeed Insights green scores
- [ ] Share on social media (check Open Graph)
- [ ] Submit sitemap to Google Search Console
- [ ] Set up uptime monitoring

---

## Quick Reference Legend

- 📁 File/folder
- ⚙️ Configuration
- 🎨 Design/styling
- 🧭 Navigation
- ✅ Task/checklist item
- ❌ Don't do this
- 💡 Tip/suggestion
- 🚀 Performance
- 🔒 Security

---

**Keep this document bookmarked for quick reference!**

Last Updated: January 21, 2026
