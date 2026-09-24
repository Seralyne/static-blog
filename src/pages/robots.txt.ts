import type { APIRoute } from "astro";

const robotsTxt = `
User-agent: *
Disallow: /_astro/
Allow: /_astro/*.png
Allow: /_astro/*.jpg
Allow: /_astro/*.jpeg
Allow: /_astro/*.webp
Allow: /_astro/*.avif
Allow: /_astro/*.gif
Allow: /_astro/*.svg

Sitemap: ${new URL("sitemap-index.xml", import.meta.env.SITE).href}
`.trim();

export const GET: APIRoute = () => {
	return new Response(robotsTxt, {
		headers: {
			"Content-Type": "text/plain; charset=utf-8",
		},
	});
};
