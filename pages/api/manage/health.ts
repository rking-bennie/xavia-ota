import { NextApiRequest, NextApiResponse } from 'next';

export default async function loginEndpoint(req: NextApiRequest, res: NextApiResponse) {
  if (req.method !== 'GET') {
    res.status(405).json({ error: 'Method not allowed' });
    return;
  }

  res.status(200).json({ status: 'up' });
}
