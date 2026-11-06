# Website Style Examples

**Practical examples showing how to transform this boilerplate into different types of websites.**

---

## Table of Contents

1. [SaaS Landing Page](#1-saas-landing-page)
2. [Portfolio Website](#2-portfolio-website)
3. [Agency Website](#3-agency-website)
4. [E-commerce Store](#4-e-commerce-store)
5. [Personal Blog](#5-personal-blog)
6. [Corporate Website](#6-corporate-website)

---

## 1. SaaS Landing Page

**Goal:** Convert visitors into trial signups with clear value proposition.

### Design Customization

**Color Scheme:** Modern tech vibes

`src/components/CustomStyles.astro`:

```astro
---
import '@fontsource-variable/inter';
---

<style is:inline>
  :root {
    --aw-font-sans: 'Inter Variable';
    --aw-font-heading: 'Inter Variable';
    
    /* Modern SaaS blues */
    --aw-color-primary: rgb(37 99 235);      /* Blue-600 */
    --aw-color-secondary: rgb(29 78 216);    /* Blue-700 */
    --aw-color-accent: rgb(59 130 246);      /* Blue-500 */
    
    --aw-color-text-default: rgb(15 23 42);  /* Slate-900 */
    --aw-color-bg-page: rgb(248 250 252);    /* Slate-50 */
  }

  .dark {
    --aw-color-bg-page: rgb(15 23 42);       /* Slate-900 */
  }
</style>
```

### Homepage Structure

`src/pages/index.astro`:

```astro
---
import Layout from '@/layouts/PageLayout.astro';
import Hero from '@/components/widgets/Hero.astro';
import Features from '@/components/widgets/Features.astro';
import Features2 from '@/components/widgets/Features2.astro';
import Stats from '@/components/widgets/Stats.astro';
import Pricing from '@/components/widgets/Pricing.astro';
import Testimonials from '@/components/widgets/Testimonials.astro';
import CallToAction from '@/components/widgets/CallToAction.astro';
import FAQs from '@/components/widgets/FAQs.astro';

const metadata = {
  title: 'CloudTask - Project Management Made Simple',
  description: 'Manage your projects, track time, and collaborate with your team in one place.',
};
---

<Layout metadata={metadata}>
  <!-- Hero with product screenshot -->
  <Hero
    title="Project Management for Modern Teams"
    subtitle="Stop juggling tools. CloudTask brings projects, tasks, time tracking, and team collaboration into one beautiful workspace."
    actions={[
      { 
        text: 'Start Free Trial', 
        href: '/signup', 
        variant: 'primary',
        icon: 'tabler:rocket' 
      },
      { 
        text: 'Watch Demo', 
        href: '#demo',
        icon: 'tabler:player-play'
      },
    ]}
    image={{ 
      src: '@/assets/images/saas-dashboard.png', 
      alt: 'CloudTask Dashboard' 
    }}
  >
    <Fragment slot="subtitle">
      <span class="text-sm text-muted">
        No credit card required · 14-day free trial · Cancel anytime
      </span>
    </Fragment>
  </Hero>

  <!-- Social Proof -->
  <Stats
    title="Trusted by 10,000+ teams worldwide"
    stats={[
      { title: 'Active Users', amount: '50K+' },
      { title: 'Projects Created', amount: '1M+' },
      { title: 'Time Saved', amount: '10M hrs' },
      { title: 'Customer Rating', amount: '4.9/5' },
    ]}
  />

  <!-- Key Features -->
  <Features
    id="features"
    title="Everything you need to manage projects"
    subtitle="Powerful features that help teams stay organized and productive"
    items={[
      {
        title: 'Task Management',
        description: 'Create, assign, and track tasks with ease. Set priorities, due dates, and dependencies.',
        icon: 'tabler:checkbox',
      },
      {
        title: 'Time Tracking',
        description: 'Built-in time tracking helps you understand where time goes and improve estimates.',
        icon: 'tabler:clock',
      },
      {
        title: 'Team Collaboration',
        description: 'Real-time chat, file sharing, and @mentions keep everyone on the same page.',
        icon: 'tabler:users',
      },
      {
        title: 'Visual Boards',
        description: 'Kanban boards, Gantt charts, and calendar views for different perspectives.',
        icon: 'tabler:layout-board',
      },
      {
        title: 'Reporting & Analytics',
        description: 'Beautiful reports and dashboards to track progress and team performance.',
        icon: 'tabler:chart-bar',
      },
      {
        title: 'Integrations',
        description: 'Connect with Slack, GitHub, Google Drive, and 50+ other tools you already use.',
        icon: 'tabler:plug',
      },
    ]}
  />

  <!-- How It Works -->
  <Features2
    title="How CloudTask Works"
    subtitle="Get started in minutes, not hours"
    items={[
      {
        title: '1. Create Your Workspace',
        description: 'Set up your team workspace in seconds. Invite team members via email or link.',
        icon: 'tabler:number-1',
      },
      {
        title: '2. Add Your Projects',
        description: 'Create projects, break them into tasks, and assign to team members.',
        icon: 'tabler:number-2',
      },
      {
        title: '3. Track Progress',
        description: 'Monitor progress in real-time with boards, timelines, and dashboards.',
        icon: 'tabler:number-3',
      },
      {
        title: '4. Deliver on Time',
        description: 'Stay on schedule with automated reminders, notifications, and reports.',
        icon: 'tabler:number-4',
      },
    ]}
  />

  <!-- Pricing -->
  <Pricing
    title="Simple, Transparent Pricing"
    subtitle="Choose the plan that fits your team size"
    prices={[
      {
        title: 'Starter',
        subtitle: 'For small teams',
        price: 9,
        period: 'per user/month',
        items: [
          { description: 'Up to 10 users' },
          { description: 'Unlimited projects' },
          { description: 'Basic reporting' },
          { description: 'Email support' },
        ],
        callToAction: {
          text: 'Start Free Trial',
          href: '/signup?plan=starter',
        },
      },
      {
        title: 'Professional',
        subtitle: 'For growing teams',
        price: 19,
        period: 'per user/month',
        items: [
          { description: 'Up to 50 users' },
          { description: 'Everything in Starter' },
          { description: 'Advanced analytics' },
          { description: 'Priority support' },
          { description: 'Custom integrations' },
        ],
        callToAction: {
          text: 'Start Free Trial',
          href: '/signup?plan=pro',
        },
        hasRibbon: true,
        ribbonTitle: 'Popular',
      },
      {
        title: 'Enterprise',
        subtitle: 'For large organizations',
        price: 'Custom',
        period: 'contact us',
        items: [
          { description: 'Unlimited users' },
          { description: 'Everything in Professional' },
          { description: 'Dedicated account manager' },
          { description: 'SLA guarantee' },
          { description: 'On-premise option' },
        ],
        callToAction: {
          text: 'Contact Sales',
          href: '/contact',
        },
      },
    ]}
  />

  <!-- Testimonials -->
  <Testimonials
    title="What Our Customers Say"
    testimonials={[
      {
        testimonial: 'CloudTask transformed how our team works. We\'re 3x more productive and actually enjoy project management now.',
        name: 'Sarah Johnson',
        job: 'VP of Engineering at TechCorp',
        image: {
          src: '@/assets/images/testimonials/sarah.jpg',
          alt: 'Sarah Johnson',
        },
      },
      {
        testimonial: 'The best project management tool we\'ve used. Intuitive, powerful, and the integrations are seamless.',
        name: 'Michael Chen',
        job: 'Creative Director at DesignStudio',
        image: {
          src: '@/assets/images/testimonials/michael.jpg',
          alt: 'Michael Chen',
        },
      },
    ]}
  />

  <!-- FAQs -->
  <FAQs
    title="Frequently Asked Questions"
    items={[
      {
        title: 'Is there a free trial?',
        description: 'Yes! All plans include a 14-day free trial with full access to all features. No credit card required.',
      },
      {
        title: 'Can I change plans later?',
        description: 'Absolutely. You can upgrade, downgrade, or cancel anytime. Changes take effect immediately.',
      },
      {
        title: 'What payment methods do you accept?',
        description: 'We accept all major credit cards (Visa, MasterCard, Amex) and PayPal.',
      },
    ]}
  />

  <!-- Final CTA -->
  <CallToAction
    title="Ready to Get Started?"
    subtitle="Join 10,000+ teams already using CloudTask to ship projects faster."
    actions={[
      {
        variant: 'primary',
        text: 'Start Free Trial',
        href: '/signup',
        icon: 'tabler:rocket',
      },
    ]}
  />
</Layout>
```

### Key SaaS Elements

1. **Clear value proposition** in hero
2. **Social proof** with stats
3. **Feature highlights** focused on benefits
4. **Transparent pricing** with trial CTA
5. **Testimonials** from real customers
6. **FAQ section** to overcome objections
7. **Multiple CTAs** throughout the page

---

## 2. Portfolio Website

**Goal:** Showcase creative work and attract clients.

### Design Customization

**Color Scheme:** Bold and creative

`src/components/CustomStyles.astro`:

```astro
---
import '@fontsource-variable/space-grotesk';
import '@fontsource-variable/playfair-display';
---

<style is:inline>
  :root {
    --aw-font-sans: 'Space Grotesk Variable';
    --aw-font-heading: 'Playfair Display Variable';
    
    /* Bold portfolio colors */
    --aw-color-primary: rgb(236 72 153);     /* Pink-500 */
    --aw-color-secondary: rgb(168 85 247);   /* Purple-500 */
    --aw-color-accent: rgb(251 191 36);      /* Amber-400 */
    
    --aw-color-bg-page: rgb(255 255 255);
  }

  .dark {
    --aw-color-bg-page: rgb(17 24 39);       /* Gray-900 */
  }
</style>
```

### Custom Portfolio Component

`src/components/widgets/PortfolioGrid.astro`:

```astro
---
import { Image } from 'astro:assets';

export interface Project {
  title: string;
  description: string;
  image: ImageMetadata | string;
  tags: string[];
  link?: string;
  featured?: boolean;
}

export interface Props {
  title?: string;
  subtitle?: string;
  projects: Project[];
}

const { title, subtitle, projects } = Astro.props;
---

<section class="py-16 md:py-24">
  <div class="mx-auto max-w-7xl px-4 sm:px-6">
    {(title || subtitle) && (
      <div class="mb-12 text-center">
        {title && (
          <h2 class="text-4xl md:text-5xl font-bold mb-4">{title}</h2>
        )}
        {subtitle && (
          <p class="text-xl text-muted max-w-2xl mx-auto">{subtitle}</p>
        )}
      </div>
    )}

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      {projects.map((project) => (
        <a
          href={project.link || '#'}
          class="group relative overflow-hidden rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 hover:scale-105"
        >
          <div class="aspect-[4/3] relative">
            <Image
              src={project.image}
              alt={project.title}
              width={800}
              height={600}
              class="object-cover w-full h-full"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
          </div>
          
          <div class="absolute bottom-0 left-0 right-0 p-6 text-white transform translate-y-4 group-hover:translate-y-0 transition-transform duration-300">
            <h3 class="text-2xl font-bold mb-2">{project.title}</h3>
            <p class="text-sm text-white/90 mb-3 opacity-0 group-hover:opacity-100 transition-opacity duration-300 delay-75">
              {project.description}
            </p>
            <div class="flex flex-wrap gap-2">
              {project.tags.map((tag) => (
                <span class="px-3 py-1 text-xs font-medium bg-white/20 backdrop-blur-sm rounded-full">
                  {tag}
                </span>
              ))}
            </div>
          </div>
          
          {project.featured && (
            <div class="absolute top-4 right-4">
              <span class="px-3 py-1 text-xs font-bold bg-accent text-black rounded-full">
                Featured
              </span>
            </div>
          )}
        </a>
      ))}
    </div>
  </div>
</section>
```

### Homepage Structure

`src/pages/index.astro`:

```astro
---
import Layout from '@/layouts/PageLayout.astro';
import HeroText from '@/components/widgets/HeroText.astro';
import PortfolioGrid from '@/components/widgets/PortfolioGrid.astro';
import Testimonials from '@/components/widgets/Testimonials.astro';
import CallToAction from '@/components/widgets/CallToAction.astro';

// Import your project images
import project1 from '@/assets/images/portfolio/project-1.jpg';
import project2 from '@/assets/images/portfolio/project-2.jpg';
import project3 from '@/assets/images/portfolio/project-3.jpg';

const metadata = {
  title: 'Alex Rivera - Creative Designer & Developer',
  description: 'Portfolio of creative work in web design, branding, and digital experiences.',
};
---

<Layout metadata={metadata}>
  <!-- Hero -->
  <HeroText
    title="Creative Designer & Developer"
    subtitle="I craft beautiful digital experiences that help brands stand out and connect with their audience."
    actions={[
      { 
        text: 'View My Work', 
        href: '#portfolio',
        variant: 'primary',
      },
      { 
        text: 'Get in Touch', 
        href: '/contact',
      },
    ]}
  />

  <!-- Services/Skills -->
  <section class="py-20 bg-gradient-to-br from-primary/5 to-accent/5">
    <div class="mx-auto max-w-7xl px-4 sm:px-6">
      <h2 class="text-3xl md:text-4xl font-bold text-center mb-12">What I Do</h2>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="p-8 bg-white dark:bg-slate-800 rounded-2xl shadow-lg">
          <div class="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mb-4">
            <Icon name="tabler:palette" class="w-8 h-8 text-primary" />
          </div>
          <h3 class="text-xl font-bold mb-3">Brand Design</h3>
          <p class="text-muted">Creating memorable visual identities that capture your brand's essence.</p>
        </div>
        
        <div class="p-8 bg-white dark:bg-slate-800 rounded-2xl shadow-lg">
          <div class="w-16 h-16 bg-secondary/10 rounded-full flex items-center justify-center mb-4">
            <Icon name="tabler:code" class="w-8 h-8 text-secondary" />
          </div>
          <h3 class="text-xl font-bold mb-3">Web Development</h3>
          <p class="text-muted">Building fast, responsive websites with modern technologies.</p>
        </div>
        
        <div class="p-8 bg-white dark:bg-slate-800 rounded-2xl shadow-lg">
          <div class="w-16 h-16 bg-accent/10 rounded-full flex items-center justify-center mb-4">
            <Icon name="tabler:rocket" class="w-8 h-8 text-accent" />
          </div>
          <h3 class="text-xl font-bold mb-3">Digital Strategy</h3>
          <p class="text-muted">Helping brands create cohesive digital experiences across platforms.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Portfolio -->
  <PortfolioGrid
    id="portfolio"
    title="Selected Work"
    subtitle="A showcase of recent projects I'm proud of"
    projects={[
      {
        title: 'EcoTech Branding',
        description: 'Complete brand identity for sustainable tech startup',
        image: project1,
        tags: ['Branding', 'Logo Design', 'Guidelines'],
        featured: true,
        link: '/portfolio/ecotech',
      },
      {
        title: 'FitTrack App',
        description: 'Mobile app design for fitness tracking platform',
        image: project2,
        tags: ['UI/UX', 'Mobile', 'Prototyping'],
        link: '/portfolio/fittrack',
      },
      {
        title: 'Artisan Bakery Website',
        description: 'E-commerce website for local bakery chain',
        image: project3,
        tags: ['Web Design', 'Development', 'E-commerce'],
        link: '/portfolio/bakery',
      },
    ]}
  />

  <!-- Testimonials -->
  <Testimonials
    title="What Clients Say"
    testimonials={[
      {
        testimonial: 'Alex delivered beyond our expectations. The branding perfectly captures who we are.',
        name: 'Emma Wilson',
        job: 'CEO, EcoTech',
      },
    ]}
  />

  <!-- CTA -->
  <CallToAction
    title="Let's Work Together"
    subtitle="Have a project in mind? I'd love to hear about it."
    actions={[
      {
        text: 'Start a Project',
        href: '/contact',
        variant: 'primary',
      },
    ]}
  />
</Layout>
```

### Key Portfolio Elements

1. **Personal introduction** highlighting expertise
2. **Skills/services section** showing what you offer
3. **Portfolio grid** with hover effects
4. **Case studies** for featured projects
5. **Client testimonials** for credibility
6. **Clear contact CTA**

---

## 3. Agency Website

**Goal:** Showcase expertise and convert leads into consultations.

### Design Customization

**Color Scheme:** Professional and trustworthy

`src/components/CustomStyles.astro`:

```astro
---
import '@fontsource-variable/dm-sans';
---

<style is:inline>
  :root {
    --aw-font-sans: 'DM Sans Variable';
    --aw-font-heading: 'DM Sans Variable';
    
    /* Professional agency colors */
    --aw-color-primary: rgb(17 24 39);       /* Gray-900 */
    --aw-color-secondary: rgb(59 130 246);   /* Blue-500 */
    --aw-color-accent: rgb(249 115 22);      /* Orange-500 */
    
    --aw-color-bg-page: rgb(255 255 255);
  }
</style>
```

### Homepage Structure

`src/pages/index.astro`:

```astro
---
import Layout from '@/layouts/PageLayout.astro';
import Hero from '@/components/widgets/Hero.astro';
import Brands from '@/components/widgets/Brands.astro';
import Features from '@/components/widgets/Features.astro';
import Steps from '@/components/widgets/Steps.astro';
import Content from '@/components/widgets/Content.astro';
import Stats from '@/components/widgets/Stats.astro';
import Testimonials from '@/components/widgets/Testimonials.astro';
import CallToAction from '@/components/widgets/CallToAction.astro';

const metadata = {
  title: 'Digital Agency - We Build Brands That Stand Out',
  description: 'Full-service digital agency specializing in branding, web design, and growth marketing.',
};
---

<Layout metadata={metadata}>
  <!-- Hero -->
  <Hero
    title="We Build Brands That Stand Out"
    subtitle="A full-service digital agency that helps ambitious brands grow through strategy, design, and marketing."
    actions={[
      { 
        text: 'Start a Project', 
        href: '/contact',
        variant: 'primary',
      },
      { 
        text: 'Our Work', 
        href: '/portfolio',
      },
    ]}
  />

  <!-- Client Logos -->
  <Brands
    title="Trusted by Industry Leaders"
    images={[
      { src: '@/assets/images/clients/client-1.svg', alt: 'Client 1' },
      { src: '@/assets/images/clients/client-2.svg', alt: 'Client 2' },
      { src: '@/assets/images/clients/client-3.svg', alt: 'Client 3' },
    ]}
  />

  <!-- Services -->
  <Features
    title="What We Do"
    subtitle="End-to-end services to elevate your brand"
    items={[
      {
        title: 'Brand Strategy',
        description: 'Define your brand positioning, messaging, and visual identity.',
        icon: 'tabler:bulb',
      },
      {
        title: 'Web Design & Development',
        description: 'Beautiful, high-performing websites that convert visitors into customers.',
        icon: 'tabler:device-desktop',
      },
      {
        title: 'Growth Marketing',
        description: 'Data-driven marketing campaigns that drive real business results.',
        icon: 'tabler:chart-line',
      },
    ]}
  />

  <!-- Process -->
  <Steps
    title="Our Process"
    subtitle="How we bring your vision to life"
    items={[
      {
        title: 'Discovery',
        description: 'We dive deep into your business, audience, and goals to create a solid foundation.',
        icon: 'tabler:search',
      },
      {
        title: 'Strategy',
        description: 'We develop a comprehensive strategy aligned with your objectives.',
        icon: 'tabler:map',
      },
      {
        title: 'Design & Build',
        description: 'Our team brings the strategy to life with stunning design and development.',
        icon: 'tabler:palette',
      },
      {
        title: 'Launch & Grow',
        description: 'We launch your project and continue optimizing for ongoing growth.',
        icon: 'tabler:rocket',
      },
    ]}
  />

  <!-- Results -->
  <Stats
    title="Results That Matter"
    stats={[
      { title: 'Clients', amount: '200+' },
      { title: 'Projects', amount: '500+' },
      { title: 'Team Members', amount: '50+' },
      { title: 'Years', amount: '10+' },
    ]}
  />

  <!-- Testimonials -->
  <Testimonials
    title="Client Success Stories"
    testimonials={[
      {
        testimonial: 'Working with this agency transformed our brand. Revenue increased 250% in the first year.',
        name: 'John Smith',
        job: 'CEO, TechStartup',
      },
    ]}
  />

  <!-- CTA -->
  <CallToAction
    title="Ready to Grow Your Brand?"
    subtitle="Let's discuss how we can help you achieve your goals."
    actions={[
      {
        text: 'Schedule a Call',
        href: '/contact',
        variant: 'primary',
      },
    ]}
  />
</Layout>
```

---

## 4. E-commerce Store

See `QUICK_REFERENCE.md` for button styles and component patterns that work well for product pages and checkout flows.

**Key additions for e-commerce:**

1. Product grid component
2. Shopping cart integration (use Snipcart or similar)
3. Product detail pages
4. Category filtering
5. Search functionality
6. Trust badges and security notices

---

## 5. Personal Blog

**Goal:** Share thoughts and build an audience.

### Design Customization

**Color Scheme:** Warm and readable

`src/components/CustomStyles.astro`:

```astro
---
import '@fontsource-variable/libre-franklin';
import '@fontsource-variable/literata';
---

<style is:inline>
  :root {
    --aw-font-sans: 'Libre Franklin Variable';
    --aw-font-serif: 'Literata Variable';
    --aw-font-heading: 'Literata Variable';
    
    /* Warm blog colors */
    --aw-color-primary: rgb(202 138 4);      /* Yellow-700 */
    --aw-color-secondary: rgb(217 119 6);    /* Amber-600 */
    --aw-color-accent: rgb(234 88 12);       /* Orange-600 */
    
    --aw-color-text-default: rgb(28 25 23);  /* Stone-900 */
    --aw-color-bg-page: rgb(255 251 235);    /* Amber-50 */
  }

  .dark {
    --aw-color-bg-page: rgb(28 25 23);
  }
</style>
```

### Blog-Focused Homepage

`src/pages/index.astro`:

```astro
---
import Layout from '@/layouts/PageLayout.astro';
import HeroText from '@/components/widgets/HeroText.astro';
import BlogLatestPosts from '@/components/widgets/BlogLatestPosts.astro';
import CallToAction from '@/components/widgets/CallToAction.astro';
---

<Layout>
  <HeroText
    title="Hi, I'm Jane Doe"
    subtitle="Writer, developer, and lifelong learner sharing thoughts on technology, creativity, and life."
  />

  <BlogLatestPosts
    title="Recent Posts"
    information="Explore my latest writings on web development, design, and productivity."
  />

  <CallToAction
    title="Subscribe to My Newsletter"
    subtitle="Get notified when I publish new articles."
    actions={[
      {
        text: 'Subscribe',
        href: '/subscribe',
        variant: 'primary',
      },
    ]}
  />
</Layout>
```

---

## 6. Corporate Website

**Goal:** Establish authority and trust for B2B clients.

### Design Customization

**Color Scheme:** Conservative and professional

```astro
:root {
  --aw-color-primary: rgb(30 58 138);      /* Blue-900 */
  --aw-color-secondary: rgb(29 78 216);    /* Blue-700 */
  --aw-color-accent: rgb(59 130 246);      /* Blue-500 */
}
```

### Key Pages Structure

- **Homepage:** Company overview, key services
- **About:** Company history, leadership team
- **Services:** Detailed service pages
- **Case Studies:** Client success stories
- **Contact:** Multiple contact methods, office locations

---

## Common Customization Patterns

### Creating a Unique Hero Style

```astro
<!-- Minimal Text-Only Hero -->
<section class="flex items-center justify-center min-h-screen bg-gradient-to-br from-primary to-secondary">
  <div class="text-center text-white max-w-4xl px-4">
    <h1 class="text-6xl md:text-8xl font-bold mb-6">
      Your Message
    </h1>
    <p class="text-2xl mb-8 opacity-90">Your subtitle</p>
    <a href="#" class="btn-primary">Get Started</a>
  </div>
</section>

<!-- Split Screen Hero -->
<section class="grid grid-cols-1 lg:grid-cols-2 min-h-screen">
  <div class="flex items-center justify-center p-12 bg-primary text-white">
    <div class="max-w-xl">
      <h1 class="text-5xl font-bold mb-6">Left Side Content</h1>
      <p class="text-xl mb-8">Your message here</p>
      <a href="#" class="btn-primary">CTA Button</a>
    </div>
  </div>
  <div class="relative">
    <Image
      src="@/assets/images/hero.jpg"
      alt="Hero"
      class="object-cover w-full h-full"
    />
  </div>
</section>
```

### Custom Section Backgrounds

```astro
<!-- Gradient Background -->
<section class="py-20 bg-gradient-to-br from-primary/10 via-secondary/10 to-accent/10">
  <!-- Content -->
</section>

<!-- Dot Pattern Background -->
<section class="py-20 relative">
  <div class="absolute inset-0 bg-[radial-gradient(circle_at_1px_1px,rgb(0_0_0/10%)_1px,transparent_0)] [background-size:24px_24px]"></div>
  <div class="relative">
    <!-- Content -->
  </div>
</section>

<!-- Diagonal Split -->
<section class="py-20 bg-gradient-to-br from-white via-white to-primary/5">
  <!-- Content -->
</section>
```

---

## Reusable Component Library

As you build, save your custom components in `src/components/custom/` for reuse:

```
src/components/custom/
├── HeroSplit.astro
├── FeatureCard.astro
├── TeamMember.astro
├── PricingCard.astro
└── NewsletterForm.astro
```

---

## Final Tips

1. **Start with wireframes** - Sketch your layout before coding
2. **Use existing widgets** - Modify instead of creating from scratch
3. **Keep it simple** - Don't over-design
4. **Mobile-first** - Design for mobile, enhance for desktop
5. **Test early** - Check on real devices frequently
6. **Iterate** - Launch MVP, improve based on feedback

---

**You now have concrete examples for 6 different website styles!** Use these as templates and mix elements to create your unique design.

Last Updated: January 21, 2026
