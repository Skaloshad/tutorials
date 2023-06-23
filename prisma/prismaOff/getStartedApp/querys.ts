import { PrismaClient } from "@prisma/client"

const createAlice = async (prisma: PrismaClient) => {
  const user = await prisma.user.create({
    data: {
      name: 'Alice3',
      email: 'alice3@prisma.io'
    }
  })
  return user
}

export {
  createAlice
}