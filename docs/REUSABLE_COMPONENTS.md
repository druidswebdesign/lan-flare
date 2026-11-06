# AstroWind Boilerplate - Reusable Components Guide

This guide documents all reusable functions, components, pages, utils, and assets available in this boilerplate for creating new landing pages.

---

## Table of Contents
- [Utility Functions](#utility-functions)
- [Constants & Configuration](#constants--configuration)
- [Type Definitions](#type-definitions)
- [UI Components](#ui-components)
- [Widget Components](#widget-components)
- [Blog Components](#blog-components)
- [Common Components](#common-components)
- [Layouts](#layouts)
- [Page Templates](#page-templates)
- [Assets](#assets)

---

## Utility Functions

### Date & Time Utilities (`@/utils/utils.ts`)
- **`formatter: Intl.DateTimeFormat`** - Date formatter instance
- **`getFormattedDate(date: Date): string`** - Format date using configured locale
- **`trim(str: string, ch?: string): string`** - Trim characters from both ends of string
- **`toUiAmount(amount: number): string`** - Format numbers as K/M/B (e.g., 1500 → 1.5K)

### Permalink Utilities (`@/utils/permalinks.ts`)
- **`getPermalink(slug: string, type: string): string`** - Generate permalink for page/blog/category/tag/asset
- **`getHomePermalink(): string`** - Get home page URL
- **`getBlogPermalink(): string`** - Get blog listing URL
- **`getAsset(path: string): string`** - Get asset URL
- **`getCanonical(path: string): string | URL`** - Generate canonical URL
- **`cleanSlug(text: string): string`** - Clean and slugify text
- **`applyGetPermalinks(menu: object): object`** - Apply permalinks to navigation menu

### Blog Utilities (`@/utils/blog.ts`)
- **`fetchPosts(): Promise<Array<Post>>`** - Fetch all blog posts
- **`findPostsBySlugs(slugs: Array<string>): Promise<Array<Post>>`** - Find posts by slugs
- **`findPostsByIds(ids: Array<string>): Promise<Array<Post>>`** - Find posts by IDs
- **`findLatestPosts({ count }): Promise<Array<Post>>`** - Get latest N posts
- **`getStaticPathsBlogList({ paginate })`** - Generate static paths for blog listing
- **`getStaticPathsBlogPost()`** - Generate static paths for individual posts
- **`getStaticPathsBlogCategory({ paginate })`** - Generate static paths for categories
- **`getStaticPathsBlogTag({ paginate })`** - Generate static paths for tags
- **`getRelatedPosts(originalPost: Post, maxResults): Promise<Post[]>`** - Get related posts

### Image Utilities (`@/utils/images.ts`)
- **`fetchLocalImages(): Promise<Record<string, Function>>`** - Fetch all local images
- **`findImage(imagePath): Promise<string | ImageMetadata | undefined>`** - Find image by path
- **`adaptOpenGraphImages(openGraph: OpenGraph): Promise<OpenGraph>`** - Adapt OG images for metadata

### Directory Utilities (`@/utils/directories.ts`)
- **`getProjectRootDir(): string`** - Get project root directory path
- **`getRelativeUrlByFilePath(filepath: string): string`** - Convert filepath to relative URL

### Frontmatter Plugins (`@/utils/frontmatter.ts`)
- **`readingTimeRemarkPlugin: RemarkPlugin`** - Add reading time to posts
- **`responsiveTablesRehypePlugin: RehypePlugin`** - Wrap tables for responsiveness
- **`lazyImagesRehypePlugin: RehypePlugin`** - Add lazy loading to images

---

## Constants & Configuration

### Site Constants (`@/constants.ts`)
- **`SITE_NAME`** - Site name constant
- **`SITE_DESCRIPTION`** - Site description
- **`IS_PRODUCTION`** - Production environment flag
- **`IS_DEVELOPMENT`** - Development environment flag
- **`CACHE_MAX_AGE`** - Cache age configuration (static assets, HTML, API)
- **`IMAGE_DOMAINS`** - Allowed image domains
- **`IMAGE_FORMATS`** - Supported image formats (webp, avif)
- **`POSTS_PER_PAGE`** - Posts per page for pagination
- **`RELATED_POSTS_COUNT`** - Number of related posts
- **`SOCIAL_HANDLES`** - Social media handles
- **`DEFAULT_OG_IMAGE`** - Default OG image dimensions

### Site Config (`@/config.yaml`)
- `site` - Site name, URL, base path, trailing slash
- `metadata` - Title, description, robots, OpenGraph, Twitter
- `i18n` - Language, text direction
- `apps.blog` - Blog configuration (isEnabled, postsPerPage, routes)
- `analytics` - Analytics vendor configuration
- `ui.theme` - Default theme (system/light/dark)

### Navigation Data (`@/navigation.ts`)
- **`headerData`** - Header navigation links and actions
- **`footerData`** - Footer links, social links, secondary links, footnote

---

## Type Definitions (`@/types.d.ts`)

### Core Types
- **`Post`** - Blog post structure (id, slug, title, excerpt, image, category, tags, author, publishDate, etc.)
- **`Taxonomy`** - Category/tag structure (slug, title)
- **`MetaData`** - Page metadata (title, description, robots, openGraph, twitter)
- **`Image`** - Image structure (src, alt)
- **`Video`** - Video structure (src, type)

### Widget Types
- **`Hero`** - Hero section (title, subtitle, tagline, content, actions, image)
- **`Features`** - Features section (title, subtitle, items, columns, image/video, callToActions)
- **`Stats`** - Statistics section (title, subtitle, stats array with amount, title, icon)
- **`Pricing`** - Pricing section (title, subtitle, prices array with title, price, items, callToAction)
- **`Testimonials`** - Testimonials section (title, subtitle, testimonials array)
- **`Brands`** - Brands/logo section (title, subtitle, icons/images)
- **`FAQs`** - FAQ section (title, subtitle, items, columns)
- **`Steps`** - Steps section (title, subtitle, items, image, callToAction)
- **`Content`** - Content section (title, subtitle, content, image, items, callToAction)
- **`Contact`** - Contact form section (title, subtitle, inputs, textarea, button)
- **`CallToAction`** - CTA section (title, subtitle, actions)

### Component Types
- **`Headline`** - Headline component (title, subtitle, tagline, classes)
- **`ItemGrid`** - Grid of items (items array, columns, defaultIcon)
- **`CallToAction`** - Button/link (variant, text, icon, href, target, type)
- **`Item`** - Feature item (title, description, icon, image, callToAction)
- **`Price`** - Pricing item (title, subtitle, price, period, items, callToAction, hasRibbon)
- **`Testimonial`** - Testimonial item (title, testimonial, name, job, image)
- **`Stat`** - Stat item (amount, title, icon)
- **`Input`** - Form input (type, name, label, autocomplete, placeholder)
- **`Textarea`** - Form textarea (label, name, placeholder, rows)
- **`Form`** - Form container (inputs, textarea, disclaimer, button, description)

---

## UI Components

### Button (`@/components/ui/Button.astro`)
**Variants:** `primary`, `secondary`, `tertiary`, `link`

```astro
<Button variant="primary" text="Get Started" href="/start" target="_blank" icon="tabler:arrow-right" />
```

**Props:**
- `variant` - Button style variant
- `text` - Button text
- `icon` - Icon name (uses astro-icon)
- `href` - Link URL
- `target` - Link target
- `type` - Button type (button/submit/reset)
- `class` - Additional CSS classes

### Headline (`@/components/ui/Headline.astro`)
Standard section headline with title, subtitle, and tagline

```astro
<Headline
  title="Section Title"
  subtitle="Section subtitle description"
  tagline="TAGLINE"
  classes={{ container: 'max-w-4xl', title: 'text-4xl' }}
/>
```

**Props:**
- `title` - Main heading text
- `subtitle` - Subtitle/description
- `tagline` - Small uppercase tagline
- `classes` - Custom classes for container, title, subtitle

### ItemGrid (`@/components/ui/ItemGrid.astro`)
Grid layout for feature items

```astro
<ItemGrid
  items={[
    { title: 'Feature 1', description: 'Description', icon: 'tabler:star' },
    { title: 'Feature 2', description: 'Description' }
  ]}
  columns={3}
  defaultIcon="tabler:check"
  classes={{ title: 'text-2xl', icon: 'text-primary' }}
/>
```

**Props:**
- `items` - Array of Item objects
- `columns` - Number of columns (1-4)
- `defaultIcon` - Default icon for items without one
- `classes` - Custom classes for container, panel, title, description, icon, action

### WidgetWrapper (`@/components/ui/WidgetWrapper.astro`)
Container wrapper for widgets with background and scroll offset

```astro
<WidgetWrapper id="features" isDark containerClass="max-w-6xl">
  <slot />
</WidgetWrapper>
```

**Props:**
- `id` - Section ID for anchor links
- `isDark` - Dark mode background
- `containerClass` - Custom container classes
- `bg` - Custom background (slot or HTML)
- `as` - HTML tag (default: 'section')

### Form (`@/components/ui/Form.astro`)
Form container with inputs, textarea, disclaimer, and submit button

```astro
<Form
  inputs={[
    { type: 'text', name: 'name', label: 'Name', placeholder: 'Your name' },
    { type: 'email', name: 'email', label: 'Email', placeholder: 'your@email.com' }
  ]}
  textarea={{ label: 'Message', placeholder: 'Your message...', rows: 5 }}
  disclaimer={{ label: 'I agree to terms' }}
  button="Send Message"
  description="We'll get back to you soon."
/>
```

**Props:**
- `inputs` - Array of Input objects
- `textarea` - Textarea configuration
- `disclaimer` - Disclaimer label
- `button` - Submit button text
- `description` - Form description

### Background (`@/components/ui/Background.astro`)
Background component for widgets

### DListItem (`@/components/ui/DListItem.astro`)
Definition list item component

### ItemGrid2 (`@/components/ui/ItemGrid2.astro`)
Alternative item grid layout

### Timeline (`@/components/ui/Timeline.astro`)
Timeline component for sequential content

---

## Widget Components

### Hero (`@/components/widgets/Hero.astro`)
Main hero section with title, subtitle, actions, and image

```astro
<Hero
  tagline="TAGLINE"
  actions={[
    { variant: 'primary', text: 'Get Started', href: '/start' },
    { variant: 'secondary', text: 'Learn More', href: '#features' }
  ]}
  image={{ src: '@/assets/images/hero.png', alt: 'Hero Image' }}
>
  <Fragment slot="title">Main Heading</Fragment>
  <Fragment slot="subtitle">Hero subtitle description</Fragment>
</Hero>
```

**Slots:** `title`, `subtitle`, `content`, `actions`, `image`, `bg`

### Hero2 (`@/components/widgets/Hero2.astro`)
Alternative hero layout

### HeroText (`@/components/widgets/HeroText.astro`)
Text-only hero section

### Features (`@/components/widgets/Features.astro`)
Features section with icon grid

```astro
<Features
  id="features"
  tagline="Features"
  title="Our Features"
  subtitle="Description of features"
  items={[
    { title: 'Feature 1', description: 'Description', icon: 'tabler:star' },
    { title: 'Feature 2', description: 'Description', icon: 'tabler:heart' }
  ]}
  columns={3}
  defaultIcon="tabler:check"
  isReversed={false}
/>
```

### Features2 (`@/components/widgets/Features2.astro`)
Alternative features layout

### Features3 (`@/components/widgets/Features3.astro`)
Another features variant

### Stats (`@/components/widgets/Stats.astro`)
Statistics/metrics display

```astro
<Stats
  tagline="Our Numbers"
  title="Statistics"
  stats={[
    { amount: '10K', title: 'Users', icon: 'tabler:users' },
    { amount: '5M', title: 'Downloads', icon: 'tabler:download' },
    { amount: '98%', title: 'Satisfaction', icon: 'tabler:heart' }
  ]}
/>
```

### Pricing (`@/components/widgets/Pricing.astro`)
Pricing table/cards

```astro
<Pricing
  tagline="Pricing"
  title="Plans"
  subtitle="Choose your plan"
  prices={[
    {
      title: 'Basic',
      price: '9',
      period: '/month',
      items: [
        { description: 'Feature 1', icon: 'tabler:check' },
        { description: 'Feature 2', icon: 'tabler:check' }
      ],
      callToAction: { text: 'Choose Basic', href: '/basic' }
    },
    {
      title: 'Pro',
      price: '29',
      period: '/month',
      items: [
        { description: 'All Basic features', icon: 'tabler:check' },
        { description: 'Pro features', icon: 'tabler:check' }
      ],
      callToAction: { text: 'Choose Pro', href: '/pro' },
      hasRibbon: true,
      ribbonTitle: 'POPULAR'
    }
  ]}
/>
```

### Testimonials (`@/components/widgets/Testimonials.astro`)
Customer testimonials section

```astro
<Testimonials
  tagline="Testimonials"
  title="What People Say"
  subtitle="Customer reviews"
  testimonials={[
    {
      title: 'Great product!',
      testimonial: 'This is amazing and changed my life.',
      name: 'John Doe',
      job: 'CEO',
      image: { src: '@/assets/images/avatar1.jpg', alt: 'John' }
    }
  ]}
  callToAction={{ text: 'Read More Reviews', href: '/reviews' }}
/>
```

### Brands (`@/components/widgets/Brands.astro`)
Logo/partner showcase

```astro
<Brands
  tagline="Trusted By"
  title="Our Partners"
  icons={['tabler:brand-github', 'tabler:brand-google', 'tabler:brand-facebook']}
/>
```

### FAQs (`@/components/widgets/FAQs.astro`)
FAQ accordion section

```astro
<FAQs
  tagline="FAQs"
  title="Frequently Asked Questions"
  subtitle="Common questions"
  items={[
    { title: 'Question 1?', description: 'Answer 1' },
    { title: 'Question 2?', description: 'Answer 2' }
  ]}
  columns={2}
/>
```

### Steps (`@/components/widgets/Steps.astro`)
Step-by-step guide section

```astro
<Steps
  title="How It Works"
  items={[
    { title: 'Step 1', description: 'First step description', icon: 'tabler:1' },
    { title: 'Step 2', description: 'Second step description', icon: 'tabler:2' },
    { title: 'Step 3', description: 'Third step description', icon: 'tabler:3' }
  ]}
  callToAction={{ text: 'Get Started', href: '/start' }}
  image={{ src: '@/assets/images/steps.jpg', alt: 'Steps' }}
  isReversed={false}
/>
```

### Steps2 (`@/components/widgets/Steps2.astro`)
Alternative steps layout

### Content (`@/components/widgets/Content.astro`)
Content with text and image side-by-side

```astro
<Content
  tagline="About"
  title="Our Story"
  subtitle="Learn more about us"
  items={[
    { title: 'Point 1', description: 'Description 1' },
    { title: 'Point 2', description: 'Description 2' }
  ]}
  image={{ src: '@/assets/images/content.jpg', alt: 'Content' }}
  isReversed={true}
  isAfterContent={true}
>
  <Fragment slot="content">Custom content HTML</Fragment>
</Content>
```

### Contact (`@/components/widgets/Contact.astro`)
Contact form section

```astro
<Contact
  tagline="Contact"
  title="Get In Touch"
  subtitle="We'd love to hear from you"
  inputs={[
    { type: 'text', name: 'name', label: 'Name', placeholder: 'Your name' },
    { type: 'email', name: 'email', label: 'Email', placeholder: 'your@email.com' }
  ]}
  textarea={{ label: 'Message', placeholder: 'Your message...', rows: 5 }}
  button="Send Message"
/>
```

### CallToAction (`@/components/widgets/CallToAction.astro`)
CTA banner section

```astro
<CallToAction
  tagline="Ready to Start?"
  title="Join Us Today"
  subtitle="Get started with our free trial"
  actions={[
    { variant: 'primary', text: 'Get Started', href: '/start' },
    { variant: 'secondary', text: 'Learn More', href: '/learn' }
  ]}
/>
```

### BlogLatestPosts (`@/components/widgets/BlogLatestPosts.astro`)
Latest blog posts grid

```astro
<BlogLatestPosts
  title="Latest Posts"
  information="Check out our recent blog posts"
/>
```

### BlogHighlightedPosts (`@/components/widgets/BlogHighlightedPosts.astro`)
Highlighted/featured blog posts

### Header (`@/components/widgets/Header.astro`)
Site navigation header with links, actions, theme toggle

```astro
<Header
  links={[...]}  // Navigation links structure
  actions={[...]}  // Header action buttons
  isSticky
  showRssFeed
  showToggleTheme
/>
```

### Footer (`@/components/widgets/Footer.astro`)
Site footer with links, social icons, copyright

```astro
<Footer
  links={[...]}  // Footer link columns
  secondaryLinks={[...]}  // Secondary links (terms, privacy)
  socialLinks={[...]}  // Social media icons
  footNote="Made by <a href='...'>Author</a>"
/>
```

### Announcement (`@/components/widgets/Announcement.astro`)
Top announcement banner

### Note (`@/components/widgets/Note.astro`)
Simple note/info banner

```astro
<Note title="Note:" description="Important information" />
```

---

## Blog Components

### Grid (`@/components/blog/Grid.astro`)
Blog post grid layout

```astro
<Grid posts={postsArray} />
```

### List (`@/components/blog/List.astro`)
Blog post list layout

### GridItem (`@/components/blog/GridItem.astro`)
Individual blog post card

### ListItem (`@/components/blog/ListItem.astro`)
Individual blog post list item

### SinglePost (`@/components/blog/SinglePost.astro`)
Single blog post display

### Headline (`@/components/blog/Headline.astro`)
Blog section headline

### Tags (`@/components/blog/Tags.astro`)
Post tags display

### Pagination (`@/components/blog/Pagination.astro`)
Pagination controls

### RelatedPosts (`@/components/blog/RelatedPosts.astro`)
Related posts section

### ToBlogLink (`@/components/blog/ToBlogLink.astro`)
Link back to blog listing

---

## Common Components

### Image (`@/components/common/Image.astro`)
Optimized image component with lazy loading

```astro
<Image
  src="@/assets/images/image.jpg"
  alt="Image description"
  widths={[400, 768, 1024]}
  sizes="(max-width: 767px) 400px, (max-width: 1023px) 768px, 1024px"
  loading="lazy"
  width={1024}
  height={576}
/>
```

### ToggleTheme (`@/components/common/ToggleTheme.astro`)
Dark/light theme toggle button

### ToggleMenu (`@/components/common/ToggleMenu.astro`)
Mobile menu toggle button

### Metadata (`@/components/common/Metadata.astro`)
Page metadata (SEO, OG tags)

### SiteVerification (`@/components/common/SiteVerification.astro`)
Search engine verification meta tags

### CommonMeta (`@/components/common/CommonMeta.astro`)
Common meta tags

### Analytics (`@/components/common/Analytics.astro`)
Analytics scripts (Google Analytics, etc.)

### SplitbeeAnalytics (`@/components/common/SplitbeeAnalytics.astro`)
Splitbee analytics integration

### LenisScroll (`@/components/common/LenisScroll.astro`)
Lenis smooth scroll integration

### ApplyColorMode (`@/components/common/ApplyColorMode.astro`)
Apply color mode to page

### SocialShare (`@/components/common/SocialShare.astro`)
Social sharing buttons

### BasicScripts (`@/components/common/BasicScripts.astro`)
Basic JavaScript functionality

---

## Layouts

### Layout (`@/layouts/Layout.astro`)
Base layout with metadata, analytics, verification

```astro
<Layout metadata={{ title: 'Page Title', description: 'Description' }}>
  <slot name="announcement" />
  <slot name="header" />
  <main>
    <slot />
  </main>
  <slot name="footer" />
</Layout>
```

### PageLayout (`@/layouts/PageLayout.astro`)
Standard page layout with header, main, footer

```astro
<PageLayout metadata={metadata}>
  <slot name="announcement" />
  <slot name="header" />
  <main>
    <slot />
  </main>
  <slot name="footer" />
</PageLayout>
```

### LandingLayout (`@/layouts/LandingLayout.astro`)
Landing page layout (minimal header)

```astro
<LandingLayout metadata={metadata}>
  <slot name="announcement" />
  <slot name="header" />
  <slot />
</LandingLayout>
```

### MarkdownLayout (`@/layouts/MarkdownLayout.astro`)
Markdown/blog post layout

---

## Page Templates

### Homepage (`src/pages/index.astro`)
Full landing page with all widget sections

### Landing Page Templates
- `src/pages/landing/lead-generation.astro` - Lead generation landing
- `src/pages/landing/sales.astro` - Long-form sales page
- `src/pages/landing/click-through.astro` - Click-through landing
- `src/pages/landing/product.astro` - Product/services landing
- `src/pages/landing/pre-launch.astro` - Coming soon/pre-launch
- `src/pages/landing/subscription.astro` - Subscription landing

### Home Variants
- `src/pages/homes/saas.astro` - SaaS homepage
- `src/pages/homes/startup.astro` - Startup homepage
- `src/pages/homes/mobile-app.astro` - Mobile app homepage
- `src/pages/homes/personal.astro` - Personal portfolio

### Standard Pages
- `src/pages/about.astro` - About page
- `src/pages/contact.astro` - Contact page
- `src/pages/services.astro` - Services page
- `src/pages/pricing.astro` - Pricing page
- `src/pages/404.astro` - 404 error page

### Blog Pages
- `src/pages/[...blog]/index.astro` - Blog listing
- `src/pages/[...blog]/[...page].astro` - Paginated blog
- `src/pages/[...blog]/[category]/[...page].astro` - Category pages
- `src/pages/[...blog]/[tag]/[...page].astro` - Tag pages

### Other Components
- `src/components/Logo.astro` - Site logo
- `src/components/Favicons.astro` - Favicons
- `src/components/CustomStyles.astro` - Custom styles

---

## Assets

### Images (`src/assets/images/`)
- `hero-image.png` - Default hero image
- `default.png` - Default OG image
- `google-play.png` - Google Play badge
- `app-store.png` - App Store badge

### Content Collections (`src/data/post/`)
- Blog posts as `.md` or `.mdx` files
- Frontmatter schema: `publishDate`, `updateDate`, `draft`, `title`, `excerpt`, `image`, `category`, `tags`, `author`, `metadata`

---

## Content Collections Schema

### Post Collection (`src/content/config.ts`)
Required frontmatter:
- `title: string` - Post title

Optional frontmatter:
- `publishDate: Date` - Publication date
- `updateDate: Date` - Last updated date
- `draft: boolean` - Draft status
- `excerpt: string` - Post excerpt
- `image: string` - Featured image path
- `category: string` - Category name
- `tags: string[]` - Array of tags
- `author: string` - Author name
- `metadata: MetaData` - Custom metadata

---

## Navigation Configuration

### Header Navigation Structure
```typescript
{
  links: [
    {
      text: 'Menu Label',
      links: [
        { text: 'Link Text', href: '/path' }
      ]
    }
  ],
  actions: [
    { text: 'Button Text', href: '/path', target: '_blank' }
  ]
}
```

### Footer Navigation Structure
```typescript
{
  links: [
    {
      title: 'Column Title',
      links: [
        { text: 'Link Text', href: '/path' }
      ]
    }
  ],
  secondaryLinks: [
    { text: 'Terms', href: '/terms' }
  ],
  socialLinks: [
    { ariaLabel: 'X', icon: 'tabler:brand-x', href: '#' }
  ],
  footNote: 'HTML footer text'
}
```

---

## Icon System

This project uses **astro-icon** for icons. Icon names follow the format `vendor:name`:

- `tabler:*` - Tabler Icons (default, most comprehensive)
- `flat-color-icons:*` - Flat Color Icons
- Add more icon sets via astro-icon configuration

**Usage:**
```astro
<Icon name="tabler:home" class="w-6 h-6" />
```

---

## Theme System

### Theme Modes
- `system` - Follow system preference (default)
- `light` - Force light mode
- `dark` - Force dark mode
- `light:only` - Light mode only, no toggle
- `dark:only` - Dark mode only, no toggle

Configure in `@/config.yaml`:
```yaml
ui:
  theme: 'system'
```

### Dark Mode Classes
Use `dark:` prefix for dark mode styles:
```html
<div class="bg-white dark:bg-slate-900 text-gray-900 dark:text-gray-100">
```

---

## Creating a New Landing Page

### Step 1: Create Page File
```bash
# Create new page in src/pages/ or src/pages/landing/
touch src/pages/landing/my-product.astro
```

### Step 2: Use Landing Layout
```astro
---
import Layout from '@/layouts/LandingLayout.astro';
import Hero from '@/components/widgets/Hero.astro';
import Features from '@/components/widgets/Features.astro';
import CallToAction from '@/components/widgets/CallToAction.astro';

const metadata = {
  title: 'My Product - Landing Page',
  description: 'Product description',
};
---

<Layout metadata={metadata}>
  <Hero
    tagline="NEW"
    title="My Product"
    subtitle="Description of product"
    actions={[{ variant: 'primary', text: 'Get Started', href: '/start' }]}
  />

  <Features
    tagline="Features"
    title="Why Choose Us"
    items={[
      { title: 'Feature 1', description: 'Description' },
      { title: 'Feature 2', description: 'Description' }
    ]}
  />

  <CallToAction
    title="Ready to Start?"
    actions={[{ variant: 'primary', text: 'Get Started', href: '/start' }]}
  />
</Layout>
```

### Step 3: Add Custom Assets
- Place images in `src/assets/images/`
- Reference with `@/assets/images/your-image.png`

### Step 4: Update Navigation
Edit `@/navigation.ts` to add links to your new page

---

## Build & Development Commands

```bash
npm run dev              # Start dev server at http://localhost:4321
npm run build            # Build production site
npm run preview          # Preview production build
npm run check            # Run all checks (type, lint, format)
npm run fix              # Auto-fix linting and formatting
```

---

## Best Practices

1. **Use Path Aliases** - Always import with `@/` prefix for `src/` files
2. **Type Safety** - Define Props interfaces in component frontmatter
3. **Responsive Design** - Use mobile-first Tailwind classes (`text-sm md:text-base`)
4. **Dark Mode** - Always include dark mode variants (`dark:bg-slate-900`)
5. **Slot Usage** - Use slots for flexible content rendering
6. **Icon Consistency** - Use Tabler icons (`tabler:*`) as default
7. **Image Optimization** - Use `<Image>` component for all images
8. **SEO** - Always provide metadata on pages
9. **Accessibility** - Include alt text, aria-labels for icons
10. **Validation** - Run `npm run check` before committing

---

## Additional Resources

- **Astro Documentation:** https://docs.astro.build
- **Tailwind CSS:** https://tailwindcss.com/docs
- **astro-icon Icons:** https://github.com/natemoo-re/astro-icon
- **Tabler Icons:** https://tabler-icons.io

