# Agent Guidelines for Starry Solstice

This document provides essential information for AI coding agents working in this repository.

## Project Overview

**Tech Stack:** Astro 5.12.9 + TypeScript 5.8.3 + Tailwind CSS 3.4.17  
**Project Type:** Static website template/landing page generator  
**Node Version:** ^18.17.1 || ^20.3.0 || >= 21.0.0

## Build, Lint & Test Commands

### Development

```bash
npm run dev              # Start dev server at http://localhost:4321
npm run build            # Build production site to dist/
npm run preview          # Preview production build locally
```

### Code Quality (Always run before committing)

```bash
npm run check            # Run ALL checks (Astro + ESLint + Prettier)
npm run check:astro      # Type checking and Astro validation
npm run check:eslint     # Lint TypeScript/JavaScript/Astro files
npm run check:prettier   # Check code formatting

npm run fix              # Auto-fix ESLint and Prettier issues
npm run fix:eslint       # Fix ESLint issues only
npm run fix:prettier     # Fix Prettier formatting only
```

### Testing

**Note:** This project has no unit/integration tests. Quality assurance relies on static analysis (type checking, linting, formatting).

### Deployment

```bash
npm run deploy           # Build and deploy to Cloudflare Pages
```

## Code Style Guidelines

### Import Conventions

1. **Use path aliases** - Always use `@/*` for `src/*` imports:

```typescript
import Layout from '@/layouts/PageLayout.astro';
import { fetchPosts } from '@/utils/blog';
import type { MetaData } from '@/types';
```

2. **Import order:**

```typescript
// 1. External dependencies
import { getCollection } from 'astro:content';

// 2. Internal components/utilities
import Hero from '@/components/widgets/Hero.astro';
import { SITE } from '@/constants';

// 3. Type imports (use 'type' keyword)
import type { Post } from '@/types';
```

3. **Virtual modules** - Config accessed via virtual module:

```typescript
import { SITE, I18N, METADATA } from 'astrowind:config';
```

### TypeScript

- **Always use TypeScript** - All `.js` files should be `.ts` (except config files)
- **Type imports** - Use `import type` for type-only imports
- **Interface props pattern:**

```typescript
export interface Props {
  title?: string;
  subtitle?: string;
  items?: Array<Item>;
}

const { title, subtitle, items = [] } = Astro.props;
```

- **Strict null checks enabled** - Handle undefined/null explicitly
- **No non-null assertions allowed** - Use optional chaining instead: `obj?.prop` not `obj!.prop`

### Astro Components

**Standard component structure:**

```astro
---
import Component from '@/components/Component.astro';
import type { Props } from '@/types';

export interface Props {
  title: string;
  subtitle?: string;
}

const { title, subtitle } = Astro.props;
const renderedSlot = await Astro.slots.render('default');
---

<div class="container">
  <h1>{title}</h1>
  {subtitle && <p>{subtitle}</p>}
  <Fragment set:html={renderedSlot} />
</div>
```

**Key patterns:**

- Define Props interface in frontmatter
- Destructure props with defaults
- Use `await Astro.slots.render()` for slot content
- Conditional rendering: `{condition && (<Component />)}`
- HTML injection: `<Fragment set:html={content} />`

### Naming Conventions

**Files:**

- Components: PascalCase (`Hero.astro`, `Button.astro`)
- Utilities: camelCase (`blog.ts`, `utils.ts`)
- Pages: lowercase with hyphens (`pricing.astro`, `[...blog]/index.astro`)

**Variables/Functions:**

- camelCase for variables and functions
- PascalCase for types and interfaces
- Prefix private/internal functions with `_` (e.g., `_posts`)

**CSS:**

- Prefer Tailwind utility classes
- Custom classes: kebab-case (`btn-primary`, `hero-section`)
- CSS custom properties: `--aw-` prefix (`--aw-color-primary`)

### Formatting (Prettier)

```javascript
{
  printWidth: 120,        // Max line length
  semi: true,             // Always use semicolons
  singleQuote: true,      // Use single quotes
  tabWidth: 2,            // 2 spaces for indentation
  trailingComma: 'es5',   // Trailing commas where valid in ES5
  useTabs: false          // Spaces not tabs
}
```

### Styling with Tailwind

**Best practices:**

- Mobile-first responsive design: `class="text-sm md:text-base lg:text-lg"`
- Dark mode support: `class="bg-white dark:bg-slate-900"`
- Use semantic color variables: `text-primary`, `bg-secondary`, `accent`
- Group related utilities: `class="flex flex-col items-center justify-between gap-4"`
- Extract repeated patterns to component layer in `tailwind.config.js`

**Common patterns:**

```astro
<!-- Container -->
<div class="mx-auto max-w-7xl px-4 sm:px-6">
  <!-- Card -->
  <div class="rounded-lg bg-white p-6 shadow-lg dark:bg-slate-800">
    <!-- Button -->
    <button class="btn btn-primary">Click me</button>
  </div>
</div>
```

### Error Handling

- Use optional chaining: `user?.profile?.name`
- Provide defaults: `const items = data?.items ?? []`
- Validate Content Collection data with Zod schemas
- Handle async errors in utility functions:

```typescript
export async function fetchData() {
  try {
    const result = await apiCall();
    return result;
  } catch (error) {
    console.error('Failed to fetch data:', error);
    return null;
  }
}
```

## Project Structure

```
src/
├── assets/              # Processed assets (images, styles)
├── components/
│   ├── blog/           # Blog-specific components
│   ├── common/         # Shared components (Image, Metadata, Analytics)
│   ├── ui/             # UI primitives (Button, Headline, ItemGrid)
│   └── widgets/        # Page section widgets (Hero, Features, CTA)
├── content/
│   └── config.ts       # Content Collections schema (Zod)
├── data/
│   └── post/           # Blog posts (.md, .mdx)
├── layouts/            # Page templates (Layout, PageLayout, LandingLayout)
├── pages/              # File-based routing
├── utils/              # Utility functions
├── config.yaml         # Site configuration (YAML)
├── constants.ts        # Runtime constants
├── navigation.ts       # Navigation structure
└── types.d.ts          # TypeScript type definitions
```

**Key files:**

- `src/config.yaml` - Main site configuration (site name, metadata, theme)
- `src/types.d.ts` - Global type definitions
- `astro.config.ts` - Astro and integration configuration
- `tailwind.config.js` - Tailwind customization

## Common Tasks

### Adding a New Page

1. Create `.astro` file in `src/pages/`
2. Import and use a layout: `import Layout from '@/layouts/PageLayout.astro';`
3. Add metadata via layout props
4. Run `npm run check` to validate

### Creating a Component

1. Create `.astro` file in appropriate subfolder (`ui/`, `widgets/`, `common/`)
2. Define Props interface in frontmatter
3. Use TypeScript for any logic
4. Style with Tailwind utilities
5. Export interface if reusable

### Modifying Site Config

- Edit `src/config.yaml` for site-wide settings
- Access via `import { SITE } from 'astrowind:config';`
- Run `npm run dev` to see changes (hot reload)

### Working with Blog Posts

- Create `.md` or `.mdx` files in `src/data/post/`
- Include required frontmatter (title, excerpt, category, tags)
- Schema validated via Content Collections
- Images go in `src/assets/images/`

### Image Optimization

- Local images: Import and use with `<Image>` component
- External images: Use `<Picture>` component with Unpic
- Automatic WebP/AVIF conversion
- Lazy loading by default

## CI/CD

GitHub Actions runs on push and PR:

- Builds site with Node 18, 20, 22 (matrix)
- Runs `npm run check` (type checking, linting, formatting)
- **No tests** - relies on static analysis

**Before pushing:**

```bash
npm run check     # Must pass
npm run fix       # Auto-fix issues
```

## Performance Considerations

- Astro renders to static HTML (fast by default)
- Use view transitions for smooth navigation
- Lazy load images and defer non-critical JS
- Minimize client-side JavaScript (prefer static)
- Use Content Collections for build-time data

## Getting Help

- **Astro docs:** https://docs.astro.build
- **Tailwind docs:** https://tailwindcss.com/docs
- **Project docs:** See README.md, DEPLOYMENT.md, OPTIMIZATIONS.md
